//
//  NavigationVCExtension.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/17/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

extension UINavigationController {

    func initRootViewController(vc: UIViewController, transitionType type: String = "kCATransitionFade", duration: CFTimeInterval = 0.3) {
        self.addTransition(transitionType: type, duration: duration)
        self.viewControllers.removeAll()
        self.pushViewController(vc, animated: false)
        self.popToRootViewController(animated: false)
    }

    private func addTransition(transitionType type: String = "kCATransitionFade", duration: CFTimeInterval = 0.3) {
        let transition = CATransition()
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType(rawValue: type)
        self.view.layer.add(transition, forKey: nil)
    }
}
