//
//  FileChecker.swift
//  JailbreakDetector
//
//  Created by ryosism on 2024/02/23.
//

import Foundation
import SwiftUI

struct FileChecker: JailbreakCheckContents {
    var id: UUID = .init()
    var contentsTitle = "特定ファイルの検知"

    func checkMethod() -> JailbreakCheckResult {
        NSLog("start checking \(contentsTitle)")
        // 複数のサイトから色々持ってきたリスト(重複あるかも)
        let targetFiles = [
            "/private/var/lib/apt",
            "/Applications/Cydia.app",
            "/Applications/RockApp.app",
            "/Applications/Icy.app",
            "/bin/sh",
            "/bin/bash",
            "/usr/libexec/sftp-server",
            "/usr/libexec/ssh-keysign",
            "/usr/sbin/sshd",
            "/var/lib",
            "/etc/apt",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/Applications/Cydia.app",
            "/Applications/FakeCarrier.app",
            "/Applications/Icy.app",
            "/Applications/IntelliScreen.app",
            "/Applications/MxTube.app",
            "/Applications/RockApp.app",
            "/Applications/SBSettings.app",
            "/Applications/WinterBoard.app",
            "/Applications/blackra1n.app",
            "/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
            "/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/System/Library/LaunchDaemons/com.ikey.bbot.plist",
            "/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
            "/etc/ssh/sshd_config",
            "/private/var/lib/apt",
            "/private/var/lib/cydia",
            "/private/var/mobile/Library/SBSettings/Themes",
            "/private/var/stash",
            "/private/var/tmp/cydia.log",
            "/var/tmp/cydia.log",
            "/usr/bin/sshd",
            "/usr/libexec/sftp-server",
            "/usr/libexec/ssh-keysign",
            "/usr/sbin/sshd",
            "/var/cache/apt",
            "/var/lib/apt",
            "/var/lib/cydia",
            "/usr/sbin/frida-server",
            "/usr/bin/cycript",
            "/usr/local/bin/cycript",
            "/usr/lib/libcycript.dylib",
            "/var/log/syslog",
            "/var/mobile/Library/Flex3",
            "/var/mobile/Library/Preferences/com.tigisoftware.Filza.plist"
        ]
        if let existFile = targetFiles.first(where: { FileManager.default.fileExists(atPath: $0) }) {
            return JailbreakCheckResult(isDetected: true, detailResult: "target file: \(existFile)")
        }
        return JailbreakCheckResult(isDetected: false)
    }
}
