//
//  IOSSecuritySuiteChecker.swift
//  JailbreakDetector
//
//  Created by ryosism on 2024/03/21.
//

import Foundation
import IOSSecuritySuite

struct IOSSecuritySuiteChecker: JailbreakCheckContents {
    var id: UUID = .init()
    var contentsTitle = "IOSSecuritySuiteによる答え合わせ"

    func checkMethod() -> JailbreakCheckResult {
        NSLog("start checking \(contentsTitle)")

        let jailbreakStatus = IOSSecuritySuite.amIJailbrokenWithFailMessage()
        if jailbreakStatus.jailbroken {
            print("This device is jailbroken")
            print("Because: \(jailbreakStatus.failMessage)")
            return JailbreakCheckResult(isDetected: true, detailResult: "\(jailbreakStatus.failMessage)")
        } else {
            print("This device is not jailbroken")
        }

        return JailbreakCheckResult(isDetected: false)
    }
}
