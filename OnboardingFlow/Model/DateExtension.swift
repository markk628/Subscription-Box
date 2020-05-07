//
//  DateExtension.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 5/6/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import Foundation

extension Date {
    var stringValue: String {
        return DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .none)
    }
}
