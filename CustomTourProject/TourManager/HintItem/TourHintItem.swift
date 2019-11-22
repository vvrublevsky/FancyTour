//
//  TourManagerHintItem.swift
//  CustomTourProject
//
//  Created by Volodymyr Vrublevskyi on 22.11.2019.
//  Copyright © 2019 NerdzLab. All rights reserved.
//

import UIKit

struct TourHintItem {
    var view: UIView
    var mask: TourMaskType = .standart
}

extension TourHintItem {
    enum TourMaskType: Equatable {
        case standart
        case round(radius: CGFloat)
        
        static func == (lhs: TourHintItem.TourMaskType, rhs: TourHintItem.TourMaskType) -> Bool {
            switch (lhs, rhs) {
            case (.standart, .standart):
                return true
            case (let .round(r1), let .round(r2)):
                return r1 == r2
            default:
                return false
            }
        }
    }
}

extension TourHintItem: Equatable {
    static func == (lhs: TourHintItem, rhs: TourHintItem) -> Bool {
        return lhs.view === rhs.view && lhs.mask == rhs.mask
    }
}
