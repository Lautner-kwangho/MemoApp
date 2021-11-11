//
//  NoteVC.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/08.
//

import UIKit
import RealmSwift

class NoteVC: UIViewController {

    static let identifier = "NoteVC"
    @IBOutlet weak var editMemoTableView: UITableView!
    var mainRealm: RealmModel?
    
    let localRealm = try! Realm()
    var tasks: Results<RealmModel>!
    
    var noteTitle = "제목을 입력해주세요"
    var noteContent = "내용을 입력해주세요"

    override func viewDidLoad() {
        super.viewDidLoad()
        editMemoTableView.delegate = self
        editMemoTableView.dataSource = self

        navigationSetting()
    }
    
    func navigationSetting() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        let okButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(saveData))
        okButton.tintColor = .orange
        self.navigationItem.rightBarButtonItem = okButton
    }
    
    @objc func saveData() {
        let task = RealmModel(title: noteTitle, content: noteContent, registDate: Date())
        if mainRealm != nil {
            print("1")
            try! localRealm.write {
                mainRealm?.title = noteTitle
                mainRealm?.content = noteContent
            }
//        } else if mainRealm == mainRealm {
//            print("2")
//            self.navigationController?.popViewController(animated: true)
        } else {
            try! localRealm.write {
                localRealm.add(task)
            }
        }
        self.navigationController?.popViewController(animated: true)
    }

}
