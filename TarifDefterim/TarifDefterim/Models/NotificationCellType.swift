//
//  NotificationCelltype.swift
//  TarifDefterim
//
//  Created by Murat Büyükbaş on 4/28/22.
//

import Foundation

enum NotificationCellType {
    case follow(viewModel: FollowNotificationCellViewModel)
    case like(viewModel: LikeNotificationCellViewModel)
    case comment(viewModel: CommentNotificationCellViewModel)
}
