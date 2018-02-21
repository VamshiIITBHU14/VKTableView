//
//  ViewController.swift
//  VKTableView
//
//  Created by Vamshi Krishna on 20/02/18.
//  Copyright © 2018 Vamshi Krishna. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
@IBOutlet weak var menuHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var teamInfoCollectionView: UICollectionView!
    
    var menuCellDataArray = [MenuCellData]()
    var teamInfoDataArray = [[TeamInfoCellData]]()
    var teamInfoDataSubArray = [TeamInfoCellData]()
    
    var titleLabelString = String()
    var titleLabelIndex = Int()
    
    var isMenuOpen = false
    override func viewDidLoad() {
        super.viewDidLoad()
        menuHeightConstraint.constant = 44
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        
        titleImage.layer.cornerRadius = titleImage.frame.size.height/2
        titleImage.layer.masksToBounds = true
        teamInfoCollectionView.dataSource = self
        teamInfoCollectionView.delegate = self
        titleLabel.text = "Team Info : India"
        menuCellDataArray = prepareMenuCellData()
        titleLabelString = "India"
        titleImage.image = UIImage(named:titleLabelString)
        titleLabelIndex = 0
        
        
        teamInfoDataArray = prepareTeamInfoData()
        teamInfoDataSubArray = teamInfoDataArray[titleLabelIndex]
        
    }
    
   
    func prepareMenuCellData() -> [MenuCellData]{
        var array = [MenuCellData]()
        array.append(MenuCellData(countryName: "India"))
        array.append(MenuCellData(countryName: "Australia"))
        array.append(MenuCellData(countryName: "Bangladesh"))
        array.append(MenuCellData(countryName: "S.Africa"))
        array.append(MenuCellData(countryName: "SriLanka"))
        array.append(MenuCellData(countryName: "NewZealand"))
        array.append(MenuCellData(countryName: "England"))
        return array
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let indexPathForFirstRow = IndexPath(row: 0, section: 0)
        menuCollectionView.selectItem(at: indexPathForFirstRow, animated: true, scrollPosition: .top)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuCollectionView{
            return menuCellDataArray.count
        }
       
        return teamInfoDataSubArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCell
            cell.menuCellData = menuCellDataArray[indexPath.item]
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCell", for: indexPath) as! TeamInfoCell
        cell.teamInfo = teamInfoDataSubArray[indexPath.item]
        return cell
        
    }
        
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == menuCollectionView{
            let cell = collectionView.cellForItem(at: indexPath) as! MenuCell
            expandAndHide()
            titleLabelString = (cell.menuCellData?.countryName)!
            titleLabelIndex = indexPath.item
            titleLabel.text = "Team Info : " + titleLabelString
            titleImage.image = UIImage(named:titleLabelString)
            
            teamInfoDataSubArray = teamInfoDataArray[titleLabelIndex]
            teamInfoCollectionView.reloadData()
        }
        
        else{
            let layout = collectionView.collectionViewLayout as! UltravisualLayout
            let offset = layout.dragOffset * CGFloat(indexPath.item)
            if collectionView.contentOffset.y != offset {
                collectionView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
            }
        }
       
    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
        expandAndHide()
    }
    
    func expandAndHide(){
        isMenuOpen = !isMenuOpen
        menuHeightConstraint.constant = isMenuOpen ? 150 : 44
        titleLabel.text = isMenuOpen ? "Select Team" : "Team Info : " + titleLabelString
        titleImage.image = isMenuOpen ? UIImage(named:"") : UIImage(named:titleLabelString)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
            let angle: CGFloat = self.isMenuOpen ? -.pi / 4 : 0.0
            self.infoButton.transform = CGAffineTransform(rotationAngle: angle)
        }, completion: nil)
    }
    
    
    func prepareTeamInfoData() -> [[TeamInfoCellData]]{
        var array = [[TeamInfoCellData]]()
        var indiaArray = [TeamInfoCellData]()
        
        indiaArray.append(TeamInfoCellData(playerName: "Mahendra Dhoni", playerDescription: "WK - Batsman", playerImageName: "dhoni"))
        indiaArray.append(TeamInfoCellData(playerName: "Virat Kohli", playerDescription: "Batsman", playerImageName: "kohli"))
        indiaArray.append(TeamInfoCellData(playerName: "Suresh Raina", playerDescription: "Batsman", playerImageName: "raina"))
        indiaArray.append(TeamInfoCellData(playerName: "Shikhar Dhawan", playerDescription: "Batsman", playerImageName: "dhawan"))
        indiaArray.append(TeamInfoCellData(playerName: "Manish Pandey", playerDescription: "Batsman", playerImageName: "pandey"))
        indiaArray.append(TeamInfoCellData(playerName: "Rohit Sharma", playerDescription: "Batsman", playerImageName: "rohit"))
        indiaArray.append(TeamInfoCellData(playerName: "Hardik Pandya", playerDescription: "All Rounder", playerImageName: "hardik"))
        indiaArray.append(TeamInfoCellData(playerName: "Kuldeep Yadav", playerDescription: "Bowler", playerImageName: "kuldeep"))
        indiaArray.append(TeamInfoCellData(playerName: "Bhuvi Kumar", playerDescription: "All Rounder", playerImageName: "bhuvi"))
        indiaArray.append(TeamInfoCellData(playerName: "Jasprit Bumrah", playerDescription: "Bowler", playerImageName: "bumrah"))
        indiaArray.append(TeamInfoCellData(playerName: "Yuz Chahal", playerDescription: "Bowler", playerImageName: "chahal"))
        
        
        var australiaArray = [TeamInfoCellData]()
        australiaArray.append(TeamInfoCellData(playerName: "Steve Smith", playerDescription: "Batsman", playerImageName: "smith"))
        australiaArray.append(TeamInfoCellData(playerName: "Shane Watson", playerDescription: "All Rounder", playerImageName: "watson"))
        australiaArray.append(TeamInfoCellData(playerName: "Shaun Marsh", playerDescription: "Batsman", playerImageName: "shaun"))
        australiaArray.append(TeamInfoCellData(playerName: "David Warner", playerDescription: "Batsman", playerImageName: "warner"))
        australiaArray.append(TeamInfoCellData(playerName: "Mitchell Marsh", playerDescription: "All Rounder", playerImageName: "mitch"))
        australiaArray.append(TeamInfoCellData(playerName: "Mathew Wade", playerDescription: "WK - Batsman", playerImageName: "wade"))
        australiaArray.append(TeamInfoCellData(playerName: "Glenn Maxwell", playerDescription: "All Rounder", playerImageName: "maxwell"))
        australiaArray.append(TeamInfoCellData(playerName: "Nathan Lyon", playerDescription: "Bowler", playerImageName: "lyon"))
        australiaArray.append(TeamInfoCellData(playerName: "Mithcell Starc", playerDescription: "Bowler", playerImageName: "starc"))
        australiaArray.append(TeamInfoCellData(playerName: "Josh Hazzelewood", playerDescription: "Bowler", playerImageName: "josh"))
        australiaArray.append(TeamInfoCellData(playerName: "Pat Cummins", playerDescription: "Bowler", playerImageName: "cummins"))
        
        
        var bangladeshArray = [TeamInfoCellData]()
        var saArray = [TeamInfoCellData]()
        var srilankaArray = [TeamInfoCellData]()
        var newZealandArray = [TeamInfoCellData]()
        var englandArray = [TeamInfoCellData]()
        
        array.append(indiaArray)
        array.append(australiaArray)
        array.append(bangladeshArray)
        array.append(saArray)
        array.append(srilankaArray)
        array.append(newZealandArray)
        array.append(englandArray)
        
        return array
    }
}

