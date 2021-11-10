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
    var tableView: UITableView?
    
    let localRealm = try! Realm()
    var tasks: Results<RealmModel>!
    
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
        self.navigationController?.popViewController(animated: true)
    }

}
