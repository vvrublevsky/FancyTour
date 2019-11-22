//
//  ChildViewController.swift
//  CustomTourProject
//
//  Created by Volodymyr Vrublevskyi on 5/6/19.
//  Copyright © 2019 NerdzLab. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {
    
    @IBOutlet var helpButton: UIButton!
        
    @IBOutlet var menuButton: JJFloatingActionButton! {
        didSet { configureMenuButton() }
    }
    
    var onMenuOpenAction: (()->Void)?
}

private extension ChildViewController {
    func configureMenuButton() {
        menuButton.delegate = self
        menuButton.buttonImage = #imageLiteral(resourceName: "menu_open")
        menuButton.highlightedButtonImage = #imageLiteral(resourceName: "menu_open_highligted.pdf")
        menuButton.buttonAnimationConfiguration = .transition(toImage: #imageLiteral(resourceName: "menu_close"), highlightedImage: #imageLiteral(resourceName: "menu_close_highlighted"))
        menuButton.notificationCount = 0
        
        menuButton.addItem(createMenuItem(title: "Party Chat",
                                          image: #imageLiteral(resourceName: "settings_upd.pdf"),
                                          highlightedImage: #imageLiteral(resourceName: "message_highlighted"),
                                          action: { item in
                                            print("Party Chat")
        }))
        
        menuButton.addItem(createMenuItem(title: "Party Settings",
                                          image: #imageLiteral(resourceName: "settings_upd.pdf"),
                                          highlightedImage: #imageLiteral(resourceName: "settings_highlighted"),
                                          action: { item in
                                            print("Party Settings")
        }))

        menuButton.addItem(createMenuItem(title: "Party Super Settings",
                                          image: #imageLiteral(resourceName: "settings_upd.pdf"),
                                          highlightedImage: #imageLiteral(resourceName: "settings_highlighted"),
                                          action: { item in
                                            print("Party Settings")
        }))
    }
    
    func createMenuItem(title: String, image: UIImage, highlightedImage: UIImage, action: @escaping (JJActionItem) -> Void) -> JJActionItem {
        let item = JJActionItem()
        
        item.buttonImage = image
        item.highlightedButtonImage = highlightedImage
        item.titleLabel.text = title
        item.action = action
        
        return item
    }
}

extension ChildViewController: JJFloatingActionButtonDelegate {
    func floatingActionButtonDidOpen(_ button: JJFloatingActionButton) {
        onMenuOpenAction?()
    }
}

