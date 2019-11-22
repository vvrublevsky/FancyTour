//
//  TourFlow.swift
//  CustomTourProject
//
//  Created by Volodymyr Vrublevskyi on 5/7/19.
//  Copyright © 2019 NerdzLab. All rights reserved.
//

import UIKit

struct TourFlow {
    let hintItems: [TourHintItem]
    let configuration: TourFlowConfiguration
    
    var onFlowStartCompletion: (()->Void)?
    var onFlowEndCompletion: (()->Void)?
    
    init(hintItems: [TourHintItem], configuration: TourFlowConfiguration, onFlowStartCompletion: (()->Void)?, onFlowEndCompletion: (()->Void)?) {
        self.hintItems = hintItems
        self.configuration = configuration
        self.onFlowStartCompletion = onFlowStartCompletion
        self.onFlowEndCompletion = onFlowEndCompletion
    }
}
