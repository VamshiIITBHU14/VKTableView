//
//  MenuCell.swift
//  VKTableView
//
//  Created by Vamshi Krishna on 20/02/18.
//  Copyright © 2018 Vamshi Krishna. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countryImage.layer.cornerRadius = countryImage.frame.size.height/2
        countryImage.layer.masksToBounds = true
    }
    
    var menuCellData:MenuCellData?{
        didSet{
            if let data = menuCellData{
                countryLabel.text = data.countryName
                countryImage.image = UIImage(named: (data.countryName)!)
            }
        }
    }
    
    override var isSelected: Bool {
        didSet {
            self.layer.borderWidth = 3.0
            self.layer.borderColor = isSelected ? UIColor.blue.cgColor : UIColor.clear.cgColor
        }
    }
}

class MenuCellData:NSObject{
    var countryName:String?
    
    init(countryName:String){
        self.countryName = countryName
    }
}

class TeamInfoCellData:NSObject{
    var playerName : String?
    var playerDescription : String?
    var playerImageName:String
    
    init(playerName:String, playerDescription:String, playerImageName: String){
        self.playerName = playerName
        self.playerDescription = playerDescription
        self.playerImageName = playerImageName
    }
}
