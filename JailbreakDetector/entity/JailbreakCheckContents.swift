//
//  JailbreakCheckContents.swift
//  JailbreakDetector
//
//  Created by ryosism on 2024/01/13.
//

import Foundation
import SwiftUI

protocol JailbreakCheckContents: Identifiable where ID == UUID {
    var id: Self.ID { get }
    var contentsTitle: String { get }
    func checkMethod() -> JailbreakCheckResult
}

struct JailbreakCheckResult {
    let isDetected: Bool
    let detailResult: String?

    init(isDetected: Bool = false, detailResult: String? = "") {
        self.isDetected = isDetected
        self.detailResult = detailResult
    }
}
