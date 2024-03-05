//
//  ContentView.swift
//  JailbreakDetector
//
//  Created by ryosism on 2024/01/13.
//

import SwiftUI

struct ContentView: View {
    let checkList: [any JailbreakCheckContents] = [
        PathChecker(),
        FileChecker(),
        SandboxChecker(),
        SystemAPICallChecker(),
        LibraryInjectionChecker()
    ]

    var body: some View {
        NavigationStack {
            List(checkList, id: \.contentsTitle) { content in
                NavigationLink {
                    CheckResultView(result: content.checkMethod())
                        .navigationTitle(content.contentsTitle)
                } label: {
                    Text(content.contentsTitle)
                }
            }
            .navigationTitle("JailbreakDetector")
        }
    }
}

#Preview {
    ContentView()
}
