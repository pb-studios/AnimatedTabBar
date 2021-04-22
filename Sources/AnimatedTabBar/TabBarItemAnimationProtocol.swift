//
//  TabBarItemAnimationProtocol.swift
//  Photo Vault
//
//  Created by HASAN CAN on 9/16/20.
//  Copyright © 2020 pbstudio. All rights reserved.
//

import Foundation
import UIKit

public protocol TabBarItemAnimationProtocol {
    func playAnimation(_ icon: UIImageView, textLabel: UILabel)
    func deselectAnimation(_ icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor, defaultIconColor: UIColor)
    func selectedState(_ icon: UIImageView, textLabel: UILabel)
}

/// Base class for UITabBarItems animation
open class ItemAnimation: NSObject, TabBarItemAnimationProtocol {
    // MARK: constants

    struct Constants {
        struct AnimationKeys {
            static let scale = "transform.scale"
            static let rotation = "transform.rotation"
            static let keyFrame = "contents"
            static let positionY = "position.y"
            static let opacity = "opacity"
        }
    }

    // MARK: properties

    /// The duration of the animation
    @IBInspectable open var duration: CGFloat = 0.5

    ///  The text color in selected state.
    @IBInspectable open var textSelectedColor: UIColor = UIColor(red: 0, green: 0.478_431, blue: 1, alpha: 1)

    ///  The icon color in selected state.
    @IBInspectable open var iconSelectedColor: UIColor!

    /**
     Start animation, method call when UITabBarItem is selected

     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     */
    open func playAnimation(_: UIImageView, textLabel _: UILabel) {
        fatalError("override method in subclass")
    }

    /**
     Start animation, method call when UITabBarItem is unselected

     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     - parameter defaultTextColor: default UITabBarItem text color
     - parameter defaultIconColor: default UITabBarItem icon color
     */
    open func deselectAnimation(_: UIImageView, textLabel _: UILabel, defaultTextColor _: UIColor, defaultIconColor _: UIColor) {
        fatalError("override method in subclass")
    }

    /**
     Method call when TabBarController did load

     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     */
    open func selectedState(_: UIImageView, textLabel _: UILabel) {
        fatalError("override method in subclass")
    }

    /**
     (Optional) Method call when TabBarController did load
     
     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     */
    open func deselectedState(_: UIImageView, textLabel _: UILabel) {}
}
