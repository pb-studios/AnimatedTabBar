//
//  AnimatedTabBarController+BottomLine.swift
//  Photo Vault
//
//  Created by HASAN CAN on 9/16/20.
//  Copyright © 2020 pbstudio. All rights reserved.
//

import UIKit

extension AnimatedTabBarController {
    func createBottomLine() {
        guard let currentItem = containers.first else { return }

        let container = UIView()
        container.backgroundColor = .clear
        container.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(container)

        container.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        container.heightAnchor.constraint(equalToConstant: bottomLineHeight).isActive = true

        let line = UIView()
        line.backgroundColor = bottomLineColor
        line.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(line)
        bottomLine = line

        lineLeadingConstraint = bottomLine?.leadingAnchor.constraint(equalTo: currentItem.leadingAnchor)
        lineLeadingConstraint?.isActive = true

        lineHeightConstraint = bottomLine?.heightAnchor.constraint(equalToConstant: bottomLineHeight)
        lineHeightConstraint?.isActive = true

        // add constraints
        bottomLine?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomLine?.widthAnchor.constraint(equalTo: currentItem.widthAnchor).isActive = true
    }

    func removeBottomLine() {
        guard let bottomLine = self.bottomLine else { return }

        bottomLine.superview?.removeFromSuperview()
        self.bottomLine = nil
        lineLeadingConstraint?.isActive = false
        lineLeadingConstraint = nil
    }

    func setBottomLinePosition(index: Int, animated: Bool = true) {
        guard let itemsCount = tabBar.items?.count, itemsCount > index,
        let currentItem = containers.at(index) else { return }

        lineLeadingConstraint?.isActive = false

        lineLeadingConstraint = bottomLine?.leadingAnchor.constraint(equalTo: currentItem.leadingAnchor)
        lineLeadingConstraint?.isActive = true

        if animated {
            UIView.animate(withDuration: bottomLineMoveDuration) { self.bottomLine?.superview?.layoutIfNeeded() }
        } else {
            self.bottomLine?.superview?.layoutIfNeeded()
        }
    }

    func updateBottomLineHeight(to height: CGFloat) {
        lineHeightConstraint?.isActive = false

        lineHeightConstraint = bottomLine?.heightAnchor.constraint(equalToConstant: height)
        lineHeightConstraint?.isActive = true
    }
}
