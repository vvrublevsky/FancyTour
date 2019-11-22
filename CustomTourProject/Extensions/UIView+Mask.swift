//
//  UIView+Mask.swift
//  CustomTourProject
//
//  Created by Volodymyr Vrublevskyi on 5/6/19.
//  Copyright © 2019 NerdzLab. All rights reserved.
//

import UIKit

extension UIView {
    func mask(with rect: CGRect, _ corner: CGFloat = 0.0, inverse: Bool = false) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: corner)
        let maskLayer = CAShapeLayer()

        // Handles cases when you need to mask multiple elements/frames
        if let originalMask = layer.mask, let originalShape = originalMask as? CAShapeLayer, let originalPath = originalShape.path {
            let originalBezierPath = UIBezierPath(cgPath: originalPath)
            path.append(originalBezierPath)
        }
        
        if inverse {
            path.append(UIBezierPath(rect: self.bounds))
            maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
        }

        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }
}

private var actionKey: Void?

extension UIView {
    typealias ActionCompletion = () -> ()
    
    private var action: ActionCompletion {
        get { return objc_getAssociatedObject(self, &actionKey) as! ActionCompletion }
        set { objc_setAssociatedObject(self, &actionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    func addAction(action: @escaping ActionCompletion) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(pressed))
        self.addGestureRecognizer(tap)
        self.action = action
    }
    
    @objc private func pressed(sender: UIBarButtonItem) {
        action()
    }
}
