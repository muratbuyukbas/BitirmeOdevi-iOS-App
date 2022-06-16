//
//  SinglePostCellType.swift
//  TarifDefterim
//
//  Created by Murat Büyükbaş on 5/3/22.
//

import Foundation

enum SinglePostCellType {
    case poster(viewModel: PosterCollectionViewCellViewModel)
    case post(viewModel: PostCollectionViewCellViewModel)
    case actions(viewModel: PostActionsCollectionViewCellViewModel)
    case likeCount(viewModel: PostLikesCollectionViewCellViewModel)
    case caption(viewModel: PostCaptionCollectionViewCellViewModel)
    case timestamp(viewModel: PostDatetimeCollectionViewCellViewModel)
    case comment(viewModel: Comment)
}
