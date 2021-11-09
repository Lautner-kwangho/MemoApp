//
//  NoteVC.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/08.
//

import UIKit

class NoteVC: UIViewController {

    @IBOutlet weak var editMemoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editMemoTableView.delegate = self
        editMemoTableView.dataSource = self
    }
    

}
