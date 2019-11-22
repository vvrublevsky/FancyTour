//
//  ModalTourFlowHandler.swift
//  CustomTourProject
//
//  Created by Volodymyr Vrublevskyi on 22.11.2019.
//  Copyright © 2019 NerdzLab. All rights reserved.
//

import UIKit

struct ModalTourFlowHandler: TourFlowHandler {
    var flow: TourFlow
    var controller: UIViewController
    var onFlowEndCompletion: (()->Void)?
    
    private weak var darkenOverlay: UIView?
    private weak var hintModal: HintModalView?
    private weak var hintModalTopConstraint: NSLayoutConstraint?
    
    func start() {
//        flow.onFlowStartCompletion?()
//        setupHintItems(flow.hintItems)
//        setupDarkenOverlay()
    }
       
       /// Function used to remove hint modal from the controller with the animation.
       func removeHintModal() {
           let sceneView = controller.view ?? UIView()
        
        /*
           
           UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
               self.hintModal?.transform = CGAffineTransform.identity.scaledBy(x: 0.1, y: 0.1).concatenating(CGAffineTransform.identity.translatedBy(x: -sceneView.bounds.width, y: 0.0))
               
               sceneView.layoutIfNeeded()
           }, completion: { [weak self] completed in
               if completed {
                   self?.hintModal?.removeFromSuperview()
                   self?.hintModal = nil
               }
           })
 */
       }
       
       /// Function used to create and display with animation hint modal for the first time.
       ///
       /// - Parameter config: the object with all the necessary info for hint modal.
       private func createHintModal(config: TourFlowConfiguration) {
           guard let modal = Bundle.main.loadNibNamed("HintModalView", owner: nil, options: nil)?.first as? HintModalView else { return }
           modal.translatesAutoresizingMaskIntoConstraints = false
           
           /*
           modal.title = config.title
           modal.hintDescription = config.description
           modal.hintImage = config.image
           modal.totalSteps = flows.count
           modal.currentStepIndex = currentFlowIndex
           
           modal.onNext = { [weak self] in
               self?.currentFlow?.onEndFlowCompletion?()
               
               self?.proceedToTheNextFlow()
           }
           
           let sceneView = sceneController.view ?? UIView()
           
           sceneView.addSubview(modal)
           let topConstraint = NSLayoutConstraint(item: modal,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: sceneView,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: sceneView.bounds.height)
           let leadingConstraint = NSLayoutConstraint(item: modal,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: sceneView,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 15.0)
           let trailingConstraint = NSLayoutConstraint(item: modal,
                                                       attribute: .trailing,
                                                       relatedBy: .equal,
                                                       toItem: sceneView,
                                                       attribute: .trailing,
                                                       multiplier: 1.0,
                                                       constant: -15.0)
           let heightConstraint = NSLayoutConstraint(item: modal,
                                                     attribute: .height,
                                                     relatedBy: .equal,
                                                     toItem: nil,
                                                     attribute: .notAnAttribute,
                                                     multiplier: 1.0,
                                                     constant: config.modalHeight)
           
           NSLayoutConstraint.activate([
               topConstraint,
               leadingConstraint,
               trailingConstraint,
               heightConstraint
               ])
           sceneView.layoutIfNeeded()
           
           // Firstly decrease the size of the modal, so that later it would have increasing effect during the animation
           modal.transform = CGAffineTransform.identity.scaledBy(x: 0.1, y: 0.1).concatenating(CGAffineTransform.identity.rotated(by: CGFloat.pi/2))
           
           UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
               
               modal.transform = .identity
               
               topConstraint.constant = config.topConstraintMultiplier * sceneView.bounds.height
               
               sceneView.layoutIfNeeded()
           })
           
           self.hintModal = modal
           self.hintModalTopConstraint = topConstraint
    */
       }
       
       /// Function used to change the configuration of the Hint modal which is already shown.
       ///
       /// - Parameter modal: the modal view which is displayed on the screen.
       /// - Parameter config: the object with all the necessary info for hint modal.
       private func reconfigureHintModal(modal: HintModalView, config: TourFlowConfiguration) {
           /*
           modal.title = config.title
           modal.hintDescription = config.description
           modal.hintImage = config.image
           modal.totalSteps = flows.count
           modal.currentStepIndex = currentFlowIndex
           
           let sceneView = sceneController.view ?? UIView()
           
           UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
               
               self.hintModalTopConstraint?.constant = config.topConstraintMultiplier * sceneView.bounds.height
               
               sceneView.layoutIfNeeded()
           })
    */
       }
}

// MARK: - Darken overlay setup

private extension ModalTourFlowHandler {
    func setupDarkenOverlay() {
        /*
        if let overlay = darkenOverlay {
            overlay.removeFromSuperview()
        }
        
        let sceneView = sceneController.view ?? UIView()
        
        let overlayView = UIView()
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.45)

        // Handle the case when modal still should be visible but the rest hints should be removed
        // (ie. greyed out by the overlay view)
        if let hintView = hintModal {
            sceneView.insertSubview(overlayView, belowSubview: hintView)
        } else {
            sceneView.addSubview(overlayView)
        }
                
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: sceneView.topAnchor),
            overlayView.leftAnchor.constraint(equalTo: sceneView.leftAnchor),
            overlayView.rightAnchor.constraint(equalTo: sceneView.rightAnchor),
            overlayView.bottomAnchor.constraint(equalTo: sceneView.bottomAnchor)
            ])
        
        sceneView.layoutIfNeeded()
        
        darkenOverlay = overlayView
 */
    }
    
    func removeDarkenOverlay() {
        /*
        darkenOverlay?.removeFromSuperview()
        darkenOverlay = nil
 */
    }
    
    /// Function used to create mask for specific ui element which should be visible under the darken overlay.
    /// In other words, it's used to 'cut out' part of the darken overlay view to make this ui element located under it visible.
    /// After that, darken overlay view with the same size as a mask is added under this item to make sure that transparent part
    /// is fully covered.
    ///
    /// - Parameter item: Specific UI element which should be visible during the tour flow.
    private func setMaskForItem(item: UIView) {
//        let frameInSuperview = sceneController.view.convert(item.frame, from: item.superview)
//
//        // Remove darken overlay above the area with the specific button
//        darkenOverlay?.mask(with: frameInSuperview, item.layer.cornerRadius, inverse: true)
//
//        // Insert darken overlay beneath the specific button
//        let darkenSubview = UIView(frame: item.frame)
//        darkenSubview.backgroundColor = UIColor.black.withAlphaComponent(0.45)
//        darkenSubview.layer.cornerRadius = item.layer.cornerRadius
//        item.superview?.insertSubview(darkenSubview, belowSubview: item)
    }
    
    func removeDarkenOverlaysUnderHintItems() {
//        guard let flow = activeFlow else {
//            assertionFailure()
//            return
//        }
//
//        flow.hintItems.forEach { item in
//            let itemSuperview = item.view.superview ?? UIView()
//
//            if let itemIndexInSuperview = itemSuperview.subviews.firstIndex(where: { $0 === item.view }) {
//                if itemIndexInSuperview - 1 >= 0 {
//                    let darkenOverlayView = itemSuperview.subviews[itemIndexInSuperview - 1]
//                    darkenOverlayView.removeFromSuperview()
//                }
//            }
//        }
    }
}
