//
//  SinglePostCaptionCollectionViewCell.swift
//  TarifDefterim
//
//  Created by Murat Büyükbaş on 3/14/22.
//

import UIKit

protocol SinglePostCaptionCollectionViewCellDelegate: AnyObject {
    func SinglePostCaptionCollectionViewCellDidTapCaptioon(_ cell: SinglePostCaptionCollectionViewCell)
}

class SinglePostCaptionCollectionViewCell: UICollectionViewCell {
    static let identifer = "SinglePostCaptionCollectionViewCell"

    weak var delegate: SinglePostCaptionCollectionViewCellDelegate?

    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(label)

        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(didTapCaption))
        label.addGestureRecognizer(tap)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    @objc func didTapCaption() {
        delegate?.SinglePostCaptionCollectionViewCellDidTapCaptioon(self)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let size = label.sizeThatFits(CGSize(width: contentView.bounds.size.width-12,
                                             height: contentView.bounds.size.height))
        
        label.frame = CGRect(x: 12, y: 3, width: size.width, height: size.height)

        
    }


    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }

    func configure(with viewModel: PostCaptionCollectionViewCellViewModel) {
        label.text = "\(viewModel.caption ?? "")"
        
        
    }
}
