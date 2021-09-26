//
//  UIColor.swift
//  PokemonApp
//
//  Created by Gabriel Lopes Ferreira on 04/03/21.
//

import UIKit

public extension UIColor {
    @nonobjc class var warmGrey: UIColor {
        .init(white: CGFloat(151.0) / CGFloat(255.0), alpha: CGFloat(1.0))
    }
    
    @nonobjc class var lightGrayBackground: UIColor {
        .init(red: CGFloat(243)/CGFloat(255.0), green: CGFloat(243)/CGFloat(255.0), blue: CGFloat(243)/CGFloat(255.0), alpha: CGFloat(1.0))
    }
    
    @nonobjc class var grassPrimary: UIColor {
        .init(red: CGFloat(64)/CGFloat(255.0), green: CGFloat(203)/CGFloat(255.0), blue: CGFloat(168)/CGFloat(255.0), alpha: CGFloat(1.0))
    }
    
    @nonobjc class var grassSecondary: UIColor {
        .init(red: CGFloat(64)/CGFloat(255.0), green: CGFloat(215)/CGFloat(255.0), blue: CGFloat(168)/CGFloat(255.0), alpha: CGFloat(1.0))
    }
    
    @nonobjc class var grassTerciary: UIColor {
        .init(red: CGFloat(57)/CGFloat(255.0), green: CGFloat(190)/CGFloat(255.0), blue: CGFloat(156)/CGFloat(255.0), alpha: CGFloat(1.0))
    }
    
    @nonobjc class var firePrimary: UIColor {
        .init(red: CGFloat(250)/CGFloat(255.0), green: CGFloat(95)/CGFloat(255.0), blue: CGFloat(97)/CGFloat(255.0), alpha: CGFloat(1.0))
    }
    
    @nonobjc class var fireSecondary: UIColor {
        .init(red: CGFloat(252)/CGFloat(255.0), green: CGFloat(120)/CGFloat(255.0), blue: CGFloat(122)/CGFloat(255.0), alpha: CGFloat(1.0))
    }
    
    @nonobjc class var fireTerciary: UIColor {
        .init(red: CGFloat(242)/CGFloat(255.0), green: CGFloat(80)/CGFloat(255.0), blue: CGFloat(83)/CGFloat(255.0), alpha: CGFloat(1.0))
    }
    
    @nonobjc class var waterPrimary: UIColor {
        .init(red: CGFloat(107)/CGFloat(255.0), green: CGFloat(179)/CGFloat(255.0), blue: CGFloat(251)/CGFloat(255.0), alpha: CGFloat(1.0))
    }
    
    @nonobjc class var waterSecondary: UIColor {
        .init(red: CGFloat(123)/CGFloat(255.0), green: CGFloat(193)/CGFloat(255.0), blue: CGFloat(251)/CGFloat(255.0), alpha: CGFloat(1.0))
    }
    
    @nonobjc class var waterTerciary: UIColor {
        .init(red: CGFloat(97)/CGFloat(255.0), green: CGFloat(167)/CGFloat(255.0), blue: CGFloat(243)/CGFloat(255.0), alpha: CGFloat(1.0))
    }
}
