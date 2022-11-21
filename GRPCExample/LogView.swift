//
//  LogView.swift
//  GRPCExample
//
//  Created by Vladislav Maltsev on 21.11.2022.
//

import SwiftUI

struct LogView: View {
    var logs: [String]

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 8) {
                ForEach(0..<logs.count) { index in
                    Text(logs[index])
                }
            }
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView(logs: ["aa", "b", "ccc"])
    }
}
