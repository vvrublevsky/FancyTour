//
//  HintModalView.swift
//  CustomTourProject
//
//  Created by Volodymyr Vrublevskyi on 5/6/19.
//  Copyright © 2019 NerdzLab. All rights reserved.
//

import UIKit

class HintModalView: UIView {
    
    @IBOutlet private var hintImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var stepPageControll: UIPageControl!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var hintDescription: String? {
        didSet {
            descriptionLabel.text = hintDescription
        }
    }
    
    var hintImage: UIImage? {
        didSet {
            hintImageView.image = hintImage
        }
    }
    
    var currentStepIndex: Int = 0 {
        didSet {
            stepPageControll.currentPage = currentStepIndex
        }
    }
    
    var totalSteps: Int = 0 {
        didSet {
            stepPageControll.numberOfPages = totalSteps
        }
    }
    
    var onNext: (()->Void)?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 8.0
    }
    
    @IBAction private func didPressNextButton() {
        onNext?()
    }
}
