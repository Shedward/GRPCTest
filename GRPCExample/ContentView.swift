//
//  ContentView.swift
//  GRPCExample
//
//  Created by Vladislav Maltsev on 21.11.2022.
//

import SwiftUI

struct ContentView: View {

    let demoInteractor = DemoInteractor()

    @State
    var result: Result<String, Error>?

    @State
    var connectionStatus: String = " -- "
    @State
    var lastGRPCError: String = " -- "
    @State
    var networkStatus: String = " -- "

    var body: some View {
        NavigationView {
            VStack(spacing: 32) {
                VStack {
                    Text("Response: ").font(.caption)
                    switch result {
                    case .success(let id):
                        Text("Success \(id)")
                    case .failure(let error):
                        Text("Failed \(error.localizedDescription)")
                            .foregroundColor(.red)
                    case .none:
                        Text(" -- ")

                    }
                }

                VStack {
                    Text("Connection status:").font(.caption)
                    Text(connectionStatus)
                        .foregroundColor(.green)
                }

                VStack {
                    Text("Last GRPC connection error:")
                        .font(.caption)
                    Text(lastGRPCError)
                        .foregroundColor(.red)
                }

                VStack {
                    Text("Network status:")
                        .font(.caption)
                    Text(networkStatus)
                }

                NavigationLink("Show logs") {
                    LogView(logs: demoInteractor.logs)
                }

                Spacer()
                    .frame(height: 32)

                Button("Send request") {
                    self.result = nil
                    self.logEvent("Request: Started")
                    demoInteractor.sendRequest { result in
                        self.logEvent("Request: Finished \(result)")
                        self.result = result
                    }
                }
            }
        }
        .onAppear {
            demoInteractor.subscribeToStatus { status in
                self.connectionStatus = status
                self.logEvent("Connection: Status changed to \(status)")
            } handleError: { error in
                self.logEvent("Connection: Did catch error \(error)")
                self.lastGRPCError = error
            }
            demoInteractor.subscribeToNetworkStatus { networkStatus in
                self.logEvent("Network: \(networkStatus)")
                self.networkStatus = networkStatus
            }
        }
    }

    private func logEvent(_ message: String) {
        NSLog("GRPCExample." + message)
        demoInteractor.logs.append(message)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
