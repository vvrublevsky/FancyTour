//
//  TourManager.swift
//  CustomTourProject
//
//  Created by Volodymyr Vrublevskyi on 5/6/19.
//  Copyright © 2019 NerdzLab. All rights reserved.
//

import UIKit

class TourManager {
    
    // MARK: Variables
    
    private let flows: [TourFlow]
    private let sceneController: UIViewController
    
    private var activeFlowIndex = 0
    private var activeFlowHandler: TourFlowHandler?
    private var darkenOverlayView: UIView?
    
    // MARK: Public
    
    var onTourEndCompletion: (()->Void)?
    
    func startTour() {
        if let flow = flows.first {
            setupFlowHandler(flow: flow)
        }
    }

    // MARK: Init
    
    init(sceneController: UIViewController, flows: [TourFlow]) {
        self.sceneController = sceneController
        self.flows = flows
    }
}

// MARK: - Private Flow Handling

private extension TourManager {
    /// Function used to setup UI according to the flow object configuration.
    func setupFlowHandler(flow: TourFlow) {
        let flowHandler = TourFlowHandlerFactory.createHandler(for: flow, at: sceneController, onFlowEndCompletion: { [weak self] in
            self?.proceedToTheNextFlow()
        })
        
        activeFlowHandler = flowHandler
        activeFlowHandler?.start()
    }
    
    /// Function used to handle the state once the flow is ended either manually or automatically.
    func proceedToTheNextFlow() {
//        removeDarkenOverlaysUnderHintItems()
        let currentFlowIsTheLast = activeFlowIndex == flows.count - 1
        
        if currentFlowIsTheLast {
            removeDarkenOverlay()
            onTourEndCompletion?()
        } else {
            activeFlowIndex += 1
            setupFlowHandler(flow: flows[activeFlowIndex])
        }
    }
}


// MARK: - Darken overlay setup

private extension TourManager {
    func setupDarkenOverlay() {
        if let overlay = darkenOverlayView {
            overlay.removeFromSuperview()
        }
        
        let sceneView = sceneController.view ?? UIView()
        
        let overlayView = UIView()
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.45)

//        // Handle the case when modal still should be visible but the rest hints should be removed
//        // (ie. greyed out by the overlay view)
//        if let hintView = hintModal {
//            sceneView.insertSubview(overlayView, belowSubview: hintView)
//        } else {
//            sceneView.addSubview(overlayView)
//        }
                
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: sceneView.topAnchor),
            overlayView.leftAnchor.constraint(equalTo: sceneView.leftAnchor),
            overlayView.rightAnchor.constraint(equalTo: sceneView.rightAnchor),
            overlayView.bottomAnchor.constraint(equalTo: sceneView.bottomAnchor)
            ])
        
        sceneView.layoutIfNeeded()
        
        darkenOverlayView = overlayView
    }
    
    func removeDarkenOverlay() {
        darkenOverlayView?.removeFromSuperview()
        darkenOverlayView = nil
    }
}
