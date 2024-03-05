//
//  SystemAPICallChecker.swift
//  JailbreakDetector
//
//  Created by ryosism on 2024/02/24.
//

import Foundation

struct SystemAPICallChecker: JailbreakCheckContents {
    var id: UUID = .init()
    var contentsTitle = "SystemAPI callチェック"

    typealias ForkType = @convention (c) () -> pid_t
    func checkMethod() -> JailbreakCheckResult {
        NSLog("start checking \(contentsTitle)")
        let pointerToFork = UnsafeMutableRawPointer (bitPattern: -2)
        let forkPtr = dlsym(pointerToFork, "fork")
        let fork = unsafeBitCast(forkPtr, to: ForkType.self)
        let pid = fork()
        if pid >= 0 {
            if pid > 0 {
                kill(pid, SIGTERM)
            }
            return JailbreakCheckResult(isDetected: true)
        }
        return JailbreakCheckResult(isDetected: false)
    }
}
