//
//  TeamInfoCell.swift
//  VKTableView
//
//  Created by Vamshi Krishna on 21/02/18.
//  Copyright © 2018 Vamshi Krishna. All rights reserved.
//

import Foundation
import UIKit

class TeamInfoCell: UICollectionViewCell {
    @IBOutlet fileprivate weak var imageView: UIImageView!
    @IBOutlet fileprivate weak var imageCoverView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var teamInfo:TeamInfoCellData?{
        didSet{
            imageView.image = UIImage(named:(teamInfo?.playerImageName)!)
            titleLabel.text = teamInfo?.playerName
            descriptionLabel.text = teamInfo?.playerDescription
        }
    }
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
        let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
        let delta = 1 - ((featuredHeight - frame.height) / (featuredHeight - standardHeight))
        let minAlpha: CGFloat = 0.3
        let maxAlpha: CGFloat = 0.75
        imageCoverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        descriptionLabel.alpha = delta
    }
}
