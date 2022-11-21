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

    var body: some View {
        VStack(spacing: 32) {
            Button("Send request") {
                self.result = nil
                demoInteractor.sendRequest { result in
                    self.result = result
                }
            }

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
        }
        .padding()
        .onAppear {
            demoInteractor.subscribeToStatus { status in
                self.connectionStatus = status
            } handleError: { error in
                self.lastGRPCError = error
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
