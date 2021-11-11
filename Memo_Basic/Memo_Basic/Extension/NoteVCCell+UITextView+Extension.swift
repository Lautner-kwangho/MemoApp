//
//  NoteVC+UITextView+Extension.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/10.
//

import UIKit

extension NoteTableViewCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if let delegate = delegate {
            delegate.updateTextViewHeight(self, memoContent)
        }
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
//        if memoContent.text == "내용을 입력하세요" {
//            memoContent.text = ""
//        }
    }
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        true
    }
    func textViewDidEndEditing(_ textView: UITextView) {
//        if memoContent.text == "" {
//            memoContent.text = "내용을 입력하세요"
//            memoContent.textColor = .systemGray3
//        } else {
//            memoContent.textColor = .white
//        }
//        if memoContent.text == "" {
//            memoContent.text = "내용을 입력하세요"
//        } else  {
            noteTableView?.reloadData()
//        }
    }
}
