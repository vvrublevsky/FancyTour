//
//  TourManagerHintItemConfiguration.swift
//  CustomTourProject
//
//  Created by Volodymyr Vrublevskyi on 22.11.2019.
//  Copyright © 2019 NerdzLab. All rights reserved.
//

import UIKit

protocol TourFlowConfiguration { }

struct TourFlowModalConfiguration: TourFlowConfiguration {
    var title: String
    var description: String
    var image: UIImage?
    var modalHeight: CGFloat = 140.0
     
     // Vertical position on the screen relatively to the screen height
     var topConstraintMultiplier: CGFloat = 0.3
}
