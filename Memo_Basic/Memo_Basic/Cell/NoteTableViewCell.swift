//
//  NoteTableViewCell.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/10.
//

import UIKit
import RealmSwift
import Network

protocol NoteCellDelegate {
    // 함수 써도 되고 안써도 되는거 뭐였죠...@d...뭐라고 선언하셨는데 까먹...
    func updateTextViewHeight(_ cell: NoteTableViewCell,_ textView: UITextView)
    func sendTitle(noteTitleDelegate: String)
    func sendContent(noteContentDelegate: String)
}

class NoteTableViewCell: UITableViewCell {

    static let identifier = "NoteTableViewCell"
    let localRealm = try! Realm()
    var tasks: Results<RealmModel>!
    var mainRealm: RealmModel?
    
    @IBOutlet weak var memoContent: UITextView!
    var delegate: NoteCellDelegate?
    var cellTextViewTitle: String = ""
    var cellTextViewContent: String = ""
    var noteTableView: UITableView?
    
    // UI부터 잘못 된거 같아요.. 코드 작성하다보니 점점 산으로 가는 거 같아요.. 수정하기엔 과제 마감 시간이 없을 거 같아서 일단 구현은 해놓을게요..
    func noteConfigure(_ tableView: UITableView, indexPath: IndexPath, realm: RealmModel?) {
        guard let realm = realm else {
            return
        }
        
        if indexPath.row == 0 {
            memoContent.font = UIFont.boldSystemFont(ofSize: 30)
            
            if memoContent.text == "" {
                memoContent.text = realm.title
            } else if memoContent.text != realm.title {
                cellTextViewTitle = memoContent.text
                self.delegate?.sendTitle(noteTitleDelegate: cellTextViewTitle)
            } else if memoContent.text == realm.title {
                cellTextViewTitle = memoContent.text
                self.delegate?.sendTitle(noteTitleDelegate: cellTextViewTitle)
            }
        } else {
            memoContent.font = UIFont.systemFont(ofSize: 18)
            
            if memoContent.text == "" {
                memoContent.text = realm.content
            } else if memoContent.text != realm.content {
                cellTextViewContent = memoContent.text
                self.delegate?.sendContent(noteContentDelegate: cellTextViewContent)
            }
        }
    }
    
    func noteConfigure(_ tableView: UITableView, indexPath: IndexPath) {

        if indexPath.row == 0 {
            memoContent.font = UIFont.boldSystemFont(ofSize: 30)
            cellTextViewTitle = memoContent.text
            self.delegate?.sendTitle(noteTitleDelegate: cellTextViewTitle)
        } else {
            memoContent.font = UIFont.systemFont(ofSize: 18)
            cellTextViewContent = memoContent.text
            self.delegate?.sendContent(noteContentDelegate: cellTextViewContent)
        }
    }
    
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
