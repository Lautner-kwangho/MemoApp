//
//  MainVC.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/08.
//

import UIKit
import RealmSwift

class MainVC: UIViewController {

    static let identifier = "MainVC"
    let localRealm = try! Realm()
    var tasks: Results<RealmModel>!
    
    var filterTask: LazyFilterSequence<Results<RealmModel>>?
    
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var mainToolBar: UIToolbar!
    
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        firstStartApp()
                
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        // Realm 관리
        tasks = localRealm.objects(RealmModel.self)
        print("\(localRealm.configuration.fileURL!)")
        
        print(filterTask)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        colorUISetting()
        navigationSearchBarSetting()
        self.mainTableView.reloadData()
    }
    
    func colorUISetting() {
        view.backgroundColor = #colorLiteral(red: 0.1058690324, green: 0.1058908626, blue: 0.1058642492, alpha: 1)
        mainTableView.backgroundColor = .black
        mainToolBar.backgroundColor = .black
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.1058690324, green: 0.1058908626, blue: 0.1058642492, alpha: 1)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func navigationSearchBarSetting() {
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "검색"
        searchController.obscuresBackgroundDuringPresentation = true
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.tintColor = .white
        
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.black
            textfield.backgroundColor = UIColor.white
        }
        
        
        // View로 custom 하면 세부적으로 건드릴 수 있는데 999,999개 정도면 음 자서전인데?정규식 통해서 해결하고자 함
        
        self.navigationItem.title = "\(tasks.count)개의 메모"
        self.navigationItem.hidesSearchBarWhenScrolling = true
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

}
