//
//  ViewController.swift
//  CustomTourProject
//
//  Created by Volodymyr Vrublevskyi on 5/6/19.
//  Copyright © 2019 NerdzLab. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {
    
    @IBOutlet private var mapContainerView: UIView!
    
    private weak var childMapViewController: ChildViewController?
    
    private var tourManager: TourManager?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.setupTourManager()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embeddedMap" {
            childMapViewController = segue.destination as? ChildViewController
        }
    }
}

// MARK: - Tour manager handling

private extension ParentViewController {
    func setupTourManager() {
        if let partyMenuTourFlow = preparePartyMenuTourFlow(), let helpButtonTourFlow = prepareHelpButtonTourFlow() {
            
            let flows: [TourFlow] = [partyMenuTourFlow, helpButtonTourFlow]
            
            tourManager = TourManager(sceneController: self, flows: flows)
            
            tourManager?.startTour()
        }
    }

    private func preparePartyMenuTourFlow() -> TourFlow? {
        /*
        guard let childController = childMapViewController else { return nil }
        
        //
        let hintModalConfiguration = TourManagerHintItemModalConfiguration(title: "Party Menu", description: "The Party menu is where you access cool features such as Party chat, Party setting and more. ", image: UIImage(named: "tip_modal"))
        
        //
        var hintItems: [UIView] = []
        hintItems.append(childController.menuButton)
        
        for item in childController.menuButton.items {
            hintItems.append(item.titleContainer)
            hintItems.append(item.circleView.imageView ?? UIView())
        }
    
        //
        let flow = TourFlow(hintModalConfiguration: hintModalConfiguration, hintItems: hintItems)
        
        flow.onStartFlowCompletion = { [weak self] in
            self?.childMapViewController?.menuButton.open()
        }
        
        flow.onEndFlowCompletion = { [weak self] in
            self?.childMapViewController?.menuButton.close()
        }
        
        return flow
    */
        return nil
    }
    
    private func prepareHelpButtonTourFlow() -> TourFlow? {
        /*
        guard let childController = childMapViewController else { return nil }
        //
        let hintModalConfiguration = TourManagerHintItemModalConfiguration(title: "Help Button", description: "For when you ever need to alert your entire Party that you need urgent assistance.", image: UIImage(named: "tip_modal"))
        hintModalConfiguration.topConstraintMultiplier = 0.58
        
        //
        let hintItems: [UIView] = [childController.helpButton]
        
        //
        let flow = TourFlow(hintModalConfiguration: hintModalConfiguration, hintItems: hintItems)
        
        flow.onStartFlowCompletion = { }
        
        flow.onEndFlowCompletion = { }
        
        return flow
 */
        return nil
    }
}
