//
//  SelfAddedWordsTableViewCell.swift
//  EasyEnglish
//
//  Created by Мостовий Ігор on 3/11/19.
//  Copyright © 2019 Мостовий Ігор. All rights reserved.
//

import UIKit
import Kingfisher

final class WordCell: UITableViewCell, ReusableCell {

    // MARK: @IBActions
    @IBOutlet private weak var captureImageView: UIImageView!
    @IBOutlet private weak var wordLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    // MARK: Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        captureImageView.layer.cornerRadius = 20
        captureImageView.layer.masksToBounds = true
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        wordLabel.attributedText = nil
    }

    func setUp(_ props: Props) {
        descriptionLabel.text = props.wordDescripton
        captureImageView.kf.setImage(with: props.imageURL, placeholder: UIImage(named: "flag"))

        switch props.wordText {
        case let .regular(text):
            wordLabel.text = text
        case let .highLighted(text):
            wordLabel.attributedText = text
        }
    }
}

extension WordCell {
    struct Props {
        let wordText: TextStyle
        let wordDescripton: String
        let imageURL: URL?

        enum TextStyle {
            case regular(String)
            case highLighted(NSAttributedString)
        }
    }
}
