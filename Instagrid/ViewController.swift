//
//  ViewController.swift
//  Instagrid
//
//  Created by Cédrik Razafimanantsoa on 22/11/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var upHidden: UIButton!
    @IBOutlet weak var downHidden: UIButton!

    @IBOutlet weak var upLargeButton: UIButton!
    @IBOutlet weak var downLargeButton: UIButton!
    @IBOutlet weak var showFourButton: UIButton!
    
    @IBOutlet weak var blueFrame: UIView!
    
    @IBAction func upLarge(_ sender: UIButton) {
        upHidden.isHidden = true
        downHidden.isHidden = false
        upLargeButton.setImage(UIImage(named: "Selected"), for: .normal)
        downLargeButton.setImage(UIImage(named: "Layout 2"), for: .normal)
        showFourButton.setImage(UIImage(named: "Layout 3"), for: .normal)
    }
    
    @IBAction func downLarge(_ sender: UIButton) {
        upHidden.isHidden = false
        downHidden.isHidden = true
        upLargeButton.setImage(UIImage(named: "Layout 1"), for: .normal)
        downLargeButton.setImage(UIImage(named: "Selected"), for: .normal)
        showFourButton.setImage(UIImage(named: "Layout 3"), for: .normal)
    }
    
    @IBAction func showFour(_ sender: UIButton) {
        upHidden.isHidden = false
        downHidden.isHidden = false
        upLargeButton.setImage(UIImage(named: "Layout 1"), for: .normal)
        downLargeButton.setImage(UIImage(named: "Layout 2"), for: .normal)
        showFourButton.setImage(UIImage(named: "Selected"), for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blueFrame.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        blueFrame.layer.shadowOffset = CGSize(width: 6, height: 6)
        blueFrame.layer.shadowOpacity = 1
        blueFrame.layer.shadowRadius = 2
        blueFrame.layer.masksToBounds = false
        blueFrame.layer.cornerRadius = 4
        // Do any additional setup after loading the view.
    }


/*
 Create a link with views - Done
 Behaviour of the views based on the hidden property - Done
 One image in the new uiviews will link to a hidden property of one particular button - Done
 */
}

