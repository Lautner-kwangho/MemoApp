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
        if self.isFiltering {
            return self.filterTask?.count ?? 0
        } else {
            if section == 0 {
                return tasks.filter("favorite = true").count
            } else {
                return tasks.filter("favorite = false").count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nibName = UINib(nibName: MainTableViewCell.identifier, bundle: nil)
        mainTableView.register(nibName, forCellReuseIdentifier: MainTableViewCell.identifier)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else {
            return MainTableViewCell()
        }
        let row = tasks[indexPath.row]
        let cellDate = row.registDate
        var format: DateFormatter
                
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let weekly = Calendar.current.date(byAdding: .day, value: -7, to: Date())!

        if cellDate <= Date(), cellDate > yesterday {
            format = DateFormatter.yesterdayFormatter
        } else if cellDate <= yesterday, cellDate > weekly {
            format = DateFormatter.weeklyFormatter
        } else {
            format = DateFormatter.customFormatter
        }
        
//        let filter = filterTask[indexPath.rowcell.memoTitle.text]
        if self.isFiltering {
//            cell.memoTitle.text = filterTask
//            cell.memoTitle.text = filterTask[indexPath]
//            cell.memoTitle.text = self.filterArray[indexPath.row]
        } else {
            if indexPath.section == 0 {
                if let sectionZeroRow = tasks?.filter("favorite = true")[indexPath.row] {
                    cell.memoTitle.text = sectionZeroRow.title
                    cell.memoContent.text = sectionZeroRow.content
                    cell.registrationDate.text = format.string(from: sectionZeroRow.registDate)
                }
            } else {
                let sectionOneRow = tasks.filter("favorite = false")[indexPath.row]
                cell.memoTitle.text = sectionOneRow.title
                cell.memoContent.text = sectionOneRow.content
                cell.registrationDate.text = format.string(from: sectionOneRow.registDate)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 15
    }
    
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        return indexPath.section == 1 ? true : fal
//    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        if indexPath.section == 0 {
            let favoriteAction = UIContextualAction(style: .normal, title:  "Close", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                if indexPath.section == 0 {
                    try! self.localRealm.write {
                        let sectionZeroRow = self.tasks.filter("favorite = true")
                        
                        if sectionZeroRow.count <= 5 {
                            sectionZeroRow[indexPath.row].favorite = !sectionZeroRow[indexPath.row].favorite
                            self.mainTableView.reloadData()
                        } else {
                            self.alert(title: "5개 이상 노노", message: "추가할 수 없습니다", actionTitle: "확인")
                        }
                    }
                }
            })
            favoriteAction.image = UIImage(systemName: "pin.slash.fill")
            favoriteAction.backgroundColor = #colorLiteral(red: 1, green: 0.5165689517, blue: 0.5729488503, alpha: 1)
            
            return UISwipeActionsConfiguration(actions: [favoriteAction])
        } else {
            let favoriteAction = UIContextualAction(style: .normal, title:  "Close", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                if indexPath.section == 1 {
                    try! self.localRealm.write {
                        let sectionOneRow = self.tasks.filter("favorite = false")[indexPath.row]
                        sectionOneRow.favorite = !sectionOneRow.favorite
                        self.mainTableView.reloadData()
                    }
                }
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
