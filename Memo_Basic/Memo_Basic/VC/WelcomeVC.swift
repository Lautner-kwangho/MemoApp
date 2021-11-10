//
//  WelcomeVC.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/09.
//

import UIKit

class WelcomeVC: UIViewController {
    
    static let identifier = "WelcomeVC"
    
    @IBOutlet var welcomUIView: [UIView]!
    @IBOutlet var welcomeLabelArray: [UILabel]!
    @IBOutlet weak var okButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        okButton.setTitle("확인", for: .normal)
        welcomUIView.forEach { UIView in
            UIView.backgroundColor = #colorLiteral(red: 0.1058690324, green: 0.1058908626, blue: 0.1058642492, alpha: 1)
            UIView.layer.cornerRadius = UIView.frame.size.height * 0.1
        }
        welcomeLabelArray.forEach { UILabel in
            UILabel.adjustsFontSizeToFitWidth = true
        }
    }
    
    
    @IBAction func okButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
