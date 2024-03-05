//
//  LibraryInjectionChecker.swift
//  JailbreakDetector
//
//  Created by ryosism on 2024/02/24.
//

import SwiftUI
import Foundation
import MachO

struct LibraryInjectionChecker: JailbreakCheckContents {
    var id: UUID = .init()
    var contentsTitle = "インジェクションチェック"

    func checkMethod() -> JailbreakCheckResult {
        NSLog("start checking \(contentsTitle)")
        let suspiciousLibraries = [
                "Substrate",
                "libinjector.dylib",
            ]
            let imageCount = _dyld_image_count()
            for idx in 0..<imageCount {
                guard let cString = _dyld_get_image_name(idx) else { continue }
                let libraryPath = String(cString: cString)
                for library in suspiciousLibraries where libraryPath.localizedCaseInsensitiveContains(library) {
                    print(libraryPath)
                    return JailbreakCheckResult(isDetected: true)
                }
            }
            return JailbreakCheckResult(isDetected: false)
    }
}
