//
//  WelcomeVC.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/09.
//

import UIKit

class WelcomeVC: UIViewController {
    
    static let identifier = "WelcomeVC"
    
    @IBOutlet var welcomeLabelArray: [UILabel]!
    @IBOutlet weak var okButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabelArray.forEach { UILabel in
            UILabel.adjustsFontSizeToFitWidth = true
        }
    }
    
    
    @IBAction func okButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
