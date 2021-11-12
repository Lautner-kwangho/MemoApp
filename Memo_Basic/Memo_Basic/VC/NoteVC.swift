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
        noteTitle = mainRealm?.title ?? ""
        noteContent = mainRealm?.content ?? ""
        
        editMemoTableView.delegate = self
        editMemoTableView.dataSource = self

        navigationSetting()
    }
    
    func navigationSetting() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        let activity = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(activityVC))
        activity.tintColor = .orange
        let okButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(saveData))
        okButton.tintColor = .orange
//        UIActivityViewController
        
        self.navigationItem.rightBarButtonItems = [okButton, activity]
        
        let backButton = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: #selector(popAction))
        backButton.tintColor = .orange
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func activityVC() {
        let vc = UIActivityViewController(activityItems: [], applicationActivities: [])
        self.present(vc, animated: true)
    }
    
    @objc func popAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func saveData() {
        let task = RealmModel(title: noteTitle, content: noteContent, registDate: Date())
        if mainRealm != nil {
            try! localRealm.write {
                mainRealm?.title = noteTitle
                mainRealm?.content = noteContent
            }
        } else {
            try! localRealm.write {
                localRealm.add(task)
            }
        }
        self.navigationController?.popViewController(animated: true)
    }

}
