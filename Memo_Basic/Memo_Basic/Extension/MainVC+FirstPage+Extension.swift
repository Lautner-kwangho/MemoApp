//
//  MainVC+Onboarding+Extension.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/10.
//

import UIKit

extension MainVC {
    
    func firstStartApp() {
        if Storage.isFirstTime() {
            let storyboard = UIStoryboard(name: "Welcome", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: WelcomeVC.identifier)
            vc.modalPresentationStyle = .popover
            present(vc, animated: true)
        }
    }

}


