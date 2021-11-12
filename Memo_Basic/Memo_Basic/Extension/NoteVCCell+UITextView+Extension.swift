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
    

//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        
//        if(textField.isEqual(self.memoContent.tag)){
//            self.memoContent.becomeFirstResponder()
//            컨텐츠필드로 포커스 이동
//        }
//        return true
//    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        true
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        noteTableView?.reloadData()
    }
}
