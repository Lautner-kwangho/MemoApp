//
//  MainVC.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/08.
//

import UIKit

class MainVC: UIViewController {

    static let identifier = "MainVC"
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstStartApp()
                
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.backgroundColor = .gray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationSearchBarSetting()
    }
    
    func navigationSearchBarSetting() {
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "검색"
        searchController.obscuresBackgroundDuringPresentation = true
        
        searchController.searchResultsUpdater = self
        
        // View로 custom 하면 세부적으로 건드릴 수 있는데 999,999개 정도면 음 자서전인데?정규식 통해서 해결하고자 함
        
        self.navigationItem.title = "0000개의 메모"
        self.navigationItem.hidesSearchBarWhenScrolling = false
        //self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

}
