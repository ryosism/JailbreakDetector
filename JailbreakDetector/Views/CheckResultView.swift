//
//  CheckResultView.swift
//  JailbreakDetector
//
//  Created by ryosism on 2024/02/24.
//

import SwiftUI

struct CheckResultView: View {
    @State var result = JailbreakCheckResult()

    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/ ,spacing: 16) {
            Image(systemName: result.isDetected ? "exclamationmark.triangle.fill" : "checkmark.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(result.isDetected ? .red : .green)
            Text(result.isDetected ? "Jailbreak Detected!" : "No JailBreak Detected!")
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            if let detail = result.detailResult {
                Text(detail)
            }
            Divider()
            Button("遷移の動作確認") {
                guard let urlScheme = URL(string: "aiv-jp://") else { return }
                UIApplication.shared.open(urlScheme)
            }
        }
    }
}

#Preview {
    CheckResultView()
}
