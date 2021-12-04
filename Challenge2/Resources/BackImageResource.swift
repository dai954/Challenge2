//
//  BackImageResource.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/29.
//

import UIKit

enum BackImageResource: CaseIterable {
    case backImage1, backImage2, backImage3, backImage4, backImage5, backImage6, backImageOrange, backImgePastel, backImagePink, backImagePurple, backImageRed, backImageYellow
    
    var backImage: UIImage {
        switch self {
        case .backImage1: return #imageLiteral(resourceName: "backImage1")
        case .backImage2: return #imageLiteral(resourceName: "backImage2")
        case .backImage3: return #imageLiteral(resourceName: "backImage3")
        case .backImage4: return #imageLiteral(resourceName: "backImage4")
        case .backImage5: return #imageLiteral(resourceName: "backImage5")
        case .backImage6: return #imageLiteral(resourceName: "backImage6")
        case .backImageOrange: return #imageLiteral(resourceName: "backImageOrange")
        case .backImgePastel: return #imageLiteral(resourceName: "backImagePastel")
        case .backImagePink: return #imageLiteral(resourceName: "backImagePink")
        case .backImagePurple: return #imageLiteral(resourceName: "backImagePurple")
        case .backImageRed: return #imageLiteral(resourceName: "backImageRed")
        case .backImageYellow: return #imageLiteral(resourceName: "backImageYellow")
        }
    }
    
}
