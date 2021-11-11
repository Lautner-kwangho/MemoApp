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
        registrationDate.font = UIFont.italicSystemFont(ofSize: memoTitle.font.pointSize - 3)
        memoContent.font = UIFont.systemFont(ofSize: memoTitle.font.pointSize - 3)
        registrationDate.textColor = #colorLiteral(red: 0.4744605422, green: 0.4745442867, blue: 0.4744495153, alpha: 1)
        memoContent.textColor = #colorLiteral(red: 0.4744605422, green: 0.4745442867, blue: 0.4744495153, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
