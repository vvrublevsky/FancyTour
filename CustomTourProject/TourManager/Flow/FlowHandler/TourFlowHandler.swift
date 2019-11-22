//
//  TourFlowHandler.swift
//  CustomTourProject
//
//  Created by Volodymyr Vrublevskyi on 22.11.2019.
//  Copyright © 2019 NerdzLab. All rights reserved.
//

import UIKit

protocol TourFlowHandler {
    var flow: TourFlow { get }
    var controller: UIViewController { get }
    var onFlowEndCompletion: (()->Void)? { get }
    
    func start()
}

struct TourFlowHandlerFactory {
    static func createHandler(for flow: TourFlow, at controller: UIViewController, onFlowEndCompletion: (()->Void)?) -> TourFlowHandler {
        return ModalTourFlowHandler(flow: flow, controller: controller, onFlowEndCompletion: onFlowEndCompletion)
    }
}
