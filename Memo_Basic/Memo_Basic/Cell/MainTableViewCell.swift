//
//  Main+TableViewCell.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/08.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    static let identifier = "MainTableViewCell"
    
    @IBOutlet weak var memoTitle: UILabel!
    @IBOutlet weak var registrationDate: UILabel!
    @IBOutlet weak var memoContent: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        memoTitle.adjustsFontSizeToFitWidth = true
        registrationDate.font = UIFont.systemFont(ofSize: memoTitle.font.pointSize - 3)
        memoContent.font = UIFont.systemFont(ofSize: memoTitle.font.pointSize - 3)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
