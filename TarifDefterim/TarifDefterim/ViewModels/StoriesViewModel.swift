//
//  StoriesViewModel.swift
//  TarifDefterim
//
//  Created by Murat Büyükbaş on 5/3/22.
//

import Foundation
import UIKit

struct StoriesViewModel {
    let stories: [Story]
}

struct Story {
    let username: String
    let image: UIImage?
}
