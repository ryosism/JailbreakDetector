//
//  PathChecker.swift
//  JailbreakDetector
//
//  Created by ryosism on 2024/01/13.
//

import Foundation
import SwiftUI

struct PathChecker: JailbreakCheckContents {
    var id: UUID = .init()
    var contentsTitle = "パスのチェック"

    func checkMethod() -> JailbreakCheckResult {
        NSLog("start checking \(contentsTitle)")
        /// プライムビデオ("aiv-jp")や設定アプリ("app-settings://")は動くので大丈夫そう
        /// canOpenURLで確認済み
        ///
        let result: [String: Bool] = [
            "cydia": detectURLScheme(url: "cydia://"),
            "cydiarepo": detectURLScheme(url: "cydia://url/https://cydia.saurik.com/api/share#?source=https://example.com/repo/"),
        ]
        let isDetected = result.values.contains { $0 }
        return JailbreakCheckResult(isDetected: isDetected)
    }
}

func detectURLScheme(url: String) -> Bool {
    guard let urlScheme = URL(string: url) else { return false }
    return UIApplication.shared.canOpenURL(urlScheme)
}
