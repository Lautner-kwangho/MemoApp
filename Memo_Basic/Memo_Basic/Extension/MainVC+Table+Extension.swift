//
//  MainVC+Table+Extension.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/08.
//

import UIKit

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MainTableViewSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let title = MainTableViewSection.allCases[section].description
        let text = UILabel()
        text.text = title
        text.font = UIFont.boldSystemFont(ofSize: 25)
        
        if tasks.filter("favorite = true").count == 0 {
            if section == 0 {
                text.isHidden = true
            }
        }
        return text
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if tasks.filter("favorite = true").count == 0 {
            if section == 0 {
                return 0 
            }
        }
        return UIScreen.main.bounds.height / 15
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "TakingNote", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: NoteVC.identifier) as! NoteVC
        
        vc.mainRealm = tasks[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let favoriteTasks = tasks.filter("favorite = true")
        let nonFavoriteTasks = tasks.filter("favorite = false")
        return section == 0 ? favoriteTasks.count : nonFavoriteTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nibName = UINib(nibName: MainTableViewCell.identifier, bundle: nil)
        mainTableView.register(nibName, forCellReuseIdentifier: MainTableViewCell.identifier)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else {
            return MainTableViewCell()
        }
        let row = tasks[indexPath.row]
        cell.memoTitle.text = row.title
        cell.memoContent.text = row.content
        cell.registrationDate.text = DateFormatter.customFormatter.string(from: row.registDate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 15
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // 추후 수정 예정 ... 핵졸림
        if indexPath.section == 0 {
            let favoriteAction = UIContextualAction(style: .normal, title:  "Close", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                print("1")
                success(true)
            })
            favoriteAction.image = UIImage(systemName: "pin.slash.fill")
            favoriteAction.backgroundColor = #colorLiteral(red: 0.996542871, green: 0.6290633082, blue: 0, alpha: 1)
            
            return UISwipeActionsConfiguration(actions: [favoriteAction])
        } else {
            let favoriteAction = UIContextualAction(style: .normal, title:  "Close", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                print("1")
                success(true)
            })
            favoriteAction.image = UIImage(systemName: "pin.fill")
            favoriteAction.backgroundColor = #colorLiteral(red: 0.996542871, green: 0.6290633082, blue: 0, alpha: 1)
            
            return UISwipeActionsConfiguration(actions: [favoriteAction])
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let row = tasks[indexPath.row]
        if indexPath.section == 1 {
            try! localRealm.write {
                localRealm.delete(row)
                tableView.reloadData()
            }
                
        }
    }
}
