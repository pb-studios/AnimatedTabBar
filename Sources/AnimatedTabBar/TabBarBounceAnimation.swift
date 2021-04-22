//
//  TabBarBounceAnimation.swift
//  Photo Vault
//
//  Created by HASAN CAN on 9/16/20.
//  Copyright © 2020 pbstudio. All rights reserved.
//

import UIKit

/// The TabBarBounceAnimation class provides bounce animation.
open class TabBarBounceAnimation: ItemAnimation {
    /**
     Start animation, method call when UITabBarItem is selected

     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     */
    override open func playAnimation(_ icon: UIImageView, textLabel: UILabel) {
        playBounceAnimation(icon)
        textLabel.textColor = textSelectedColor
    }

    /**
     Start animation, method call when UITabBarItem is unselected

     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     - parameter defaultTextColor: default UITabBarItem text color
     - parameter defaultIconColor: default UITabBarItem icon color
     */
    override open func deselectAnimation(_ icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor, defaultIconColor: UIColor) {
        textLabel.textColor = defaultTextColor

        if let iconImage = icon.image {
            let renderMode = defaultIconColor.cgColor.alpha == 0 ? UIImage.RenderingMode.alwaysOriginal :
                UIImage.RenderingMode.alwaysTemplate
            let renderImage = iconImage.withRenderingMode(renderMode)
            icon.image = renderImage
            icon.tintColor = defaultIconColor
        }
    }

    /**
     Method call when TabBarController did load

     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     */
    override open func selectedState(_ icon: UIImageView, textLabel: UILabel) {
        textLabel.textColor = textSelectedColor

        if let iconImage = icon.image {
            let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
    }

    func playBounceAnimation(_ icon: UIImageView) {
        let bounceAnimation = CAKeyframeAnimation(keyPath: Constants.AnimationKeys.scale)
        bounceAnimation.values = [1.0, 1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(duration)
        bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic

        icon.layer.add(bounceAnimation, forKey: nil)

        if let iconImage = icon.image {
            let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
    }
}
