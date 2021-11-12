//
//  MainVC+SearchBar+Extension.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/08.
//

import UIKit

extension MainVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        let filter = self.tasks.filter { $0.title.lowercased().hasPrefix(text) }
        filterTask = filter
        
        dump(filterTask)
        self.mainTableView.reloadData()
    }
    
}
