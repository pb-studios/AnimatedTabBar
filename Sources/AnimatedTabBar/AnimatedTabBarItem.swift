//
//  AnimatedTabBarItem.swift
//  Photo Vault
//
//  Created by HASAN CAN on 9/16/20.
//  Copyright © 2020 pbstudio. All rights reserved.
//

import Foundation
import UIKit

/// UITabBarItem with animation
open class AnimatedTabBarItem: UITabBarItem {
    override open var isEnabled: Bool {
        didSet {
            iconView?.icon.alpha = isEnabled == true ? 1 : 0.5
            iconView?.textLabel.alpha = isEnabled == true ? 1 : 0.5
        }
    }

    /// Also posible create custom anmation inherit from the ItemAnimation look for https://github.com/Ramotion/animated-tab-bar#creating-custom-animations
    @IBOutlet open var animation: ItemAnimation!

    /// The font used to render the UITabBarItem text.
    @IBInspectable open var textFontSize: CGFloat = 10

    /// The color of the UITabBarItem text.
    @IBInspectable open var textColor: UIColor = #colorLiteral(red: 0.5079551811, green: 0.5472556715, blue: 0.6011400746, alpha: 1)

    /// The tint color of the UITabBarItem icon.
    @IBInspectable open var iconColor: UIColor = UIColor.clear // if alpha color is 0 color ignoring

    open var bgDefaultColor = UIColor.clear // background color
    open var bgSelectedColor = UIColor.clear

    //  The current badge value
    open var badge: CustomBadge? // use badgeValue to show badge

    // Container for icon and text in UITableItem.
    open var iconView: (icon: UIImageView, textLabel: UILabel)?

    /**
     Start selected animation
     */
    open func playAnimation() {
        assert(animation != nil, "add animation in UITabBarItem")
        guard animation != nil, let iconView = iconView else {
            return
        }
        animation.playAnimation(iconView.icon, textLabel: iconView.textLabel)
    }

    /**
     Start unselected animation
     */
    open func deselectAnimation() {
        guard animation != nil && iconView != nil else {
            return
        }

        animation.deselectAnimation(
            iconView!.icon,
            textLabel: iconView!.textLabel,
            defaultTextColor: textColor,
            defaultIconColor: iconColor)
    }

    /**
     Set selected state without animation
     */
    open func selectedState() {
        guard animation != nil, let iconView = iconView else {
            return
        }

        animation.selectedState(iconView.icon, textLabel: iconView.textLabel)
    }

    /**
     Set deselected state without animation
     */
    open func deselectedState() {
        guard animation != nil && iconView != nil else {
            return
        }

        animation.deselectedState(iconView!.icon, textLabel: iconView!.textLabel)
    }
}

// MARK: Custom Badge
extension AnimatedTabBarItem {
    /// The current badge value
    override open var badgeValue: String? {
        get {
            return badge?.text
        }
        set(newValue) {
            if newValue == nil {
                badge?.removeFromSuperview()
                badge = nil
                return
            }

            if let iconView = iconView, let contanerView = iconView.icon.superview, badge == nil {
                badge = CustomBadge.badge()
                badge?.addBadgeOnView(contanerView)
            }

            badge?.text = newValue
        }
    }
}
