//
//  SandboxChecker.swift
//  JailbreakDetector
//
//  Created by ryosism on 2024/02/24.
//

import Foundation

struct SandboxChecker: JailbreakCheckContents {
    var id: UUID = .init()
    var contentsTitle = "SandBoxチェック"
    func checkMethod() -> JailbreakCheckResult {
        NSLog("start checking \(contentsTitle)")
        do {
            try "jailbreak".write(toFile: "/private/jailbreak.txt",
                                  atomically: true,
                                  encoding: .utf8)
        } catch {
            return JailbreakCheckResult(isDetected: false)
        }
        return JailbreakCheckResult(isDetected: true)
    }
}
