//
//  TourManagerFlow.swift
//  CustomTourProject
//
//  Created by Volodymyr Vrublevskyi on 5/7/19.
//  Copyright © 2019 NerdzLab. All rights reserved.
//

import UIKit

/// Class used to store all necessary configurations for a specific tutorial tour flow.
class TourManagerFlow {
    
    var hintModalConfiguration: TourManagerHintModalConfiguration
    
    var hintItems: [UIView]
    
    var onStartFlowCompletion: (()->Void)?
    
    var onEndFlowCompletion: (()->Void)?
    
    init(hintModalConfiguration: TourManagerHintModalConfiguration, hintItems: [UIView]) {
        self.hintModalConfiguration = hintModalConfiguration
        self.hintItems = hintItems
    }
}
