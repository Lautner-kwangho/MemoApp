//
//  NoteTableViewCell.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/10.
//

import UIKit

protocol NoteCellDelegate {
    func updateTextViewHeight(_ cell: NoteTableViewCell,_ textView: UITextView)
}

class NoteTableViewCell: UITableViewCell {

    static let identifier = "NoteTableViewCell"
    
    @IBOutlet weak var memoContent: UITextView!
    var delegate: NoteCellDelegate?
    
//    func noteConfigure(_ tableView: UITableView, indexPath: IndexPath) {
//        if indexPath.section == 0 {
//            memoContent.text = "eqweqweewqf4asd6f6a4ad4f6a4dsf64a6df465a4sdf654a65dsf4a56d4sf6a4dsf65a4ds65fdf65a46dfs4sd2as2da2df2asdf1as3d13asd1a65sdf46a4dfs6a4ds65f4a6ds4f6a4ds6f4a6dsf4"
//        } else {
//            memoContent.text = "222"
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        memoContent.delegate = self
        memoContent.isScrollEnabled = false
        memoContent.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension NoteTableViewCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if let delegate = delegate {
            delegate.updateTextViewHeight(self, memoContent)
        }
        
        if memoContent.text == "" {
            memoContent.text = "내용을 입력하세요"
            memoContent.textColor = .systemGray5
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        memoContent.textColor = .white
    }
}
