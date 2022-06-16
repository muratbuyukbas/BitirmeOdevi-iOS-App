//
//  HapticsManager.swift
//  TarifDefterim
//
//  Created by Murat Büyükbaş on 4/7/22.
//

import Foundation
import UIKit

final class HapticManager {
    static let shared = HapticManager()

    private init() {}

    func vibrateForSelection() {
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }

    func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(type)
    }
}
