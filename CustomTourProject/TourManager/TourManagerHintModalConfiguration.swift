//
//  TourManagerHintModalConfiguration.swift
//  CustomTourProject
//
//  Created by Volodymyr Vrublevskyi on 5/7/19.
//  Copyright © 2019 NerdzLab. All rights reserved.
//

import UIKit

/// Class used to store all necessary configurations for hint modal which is going to be displayed during the tutorial tour.
class TourManagerHintModalConfiguration {
    
    var title: String
    
    var description: String
    
    var image: UIImage?
    
    var modalHeight: CGFloat = 140.0
    
    // Vertical position on the screen relatively to the screen height
    var topConstraintMultiplier: CGFloat = 0.3
    
    init(title: String, description: String, image: UIImage? = nil) {
        self.title = title
        self.description = description
        self.image = image
    }
}
