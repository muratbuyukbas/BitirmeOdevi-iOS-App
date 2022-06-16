//
//  SettingsModels.swift
//  TarifDefterim
//
//  Created by Murat Büyükbaş on 5/3/22.
//

import Foundation
import UIKit

struct SettingsSection {
    let title: String
    let options: [SettingOption]
}

struct SettingOption {
    let title: String
    let image: UIImage?
    let color: UIColor
    let handler: (() -> Void)
}
