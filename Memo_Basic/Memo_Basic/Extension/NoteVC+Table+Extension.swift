//
//  NoteVC+Table+Extension.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/10.
//

import UIKit

extension NoteVC: UITableViewDelegate, UITableViewDataSource, NoteCellDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nibName = UINib(nibName: NoteTableViewCell.identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: NoteTableViewCell.identifier)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifier, for: indexPath) as? NoteTableViewCell else {
            return NoteTableViewCell()
        }
        cell.delegate = self
        cell.noteConfigure(tableView, indexPath: indexPath)
        
        return cell
    }
    
    func updateTextViewHeight(_ cell: NoteTableViewCell, _ textView: UITextView) {
        let size = textView.bounds.size
        let updateSize = editMemoTableView.sizeThatFits(CGSize(width: size.width, height: size.height))
        if size.height != updateSize.height {
            UIView.setAnimationsEnabled(false)
            editMemoTableView.beginUpdates()
            editMemoTableView.endUpdates()
            UIView.setAnimationsEnabled(true)
        }
    }
}
