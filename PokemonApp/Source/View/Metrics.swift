//
//  Metrics.swift
//  uUI
//
//  Created by Eduardo Bocato on 13/02/20.
//  Copyright © 2020 Hotmart. All rights reserved.
//

import UIKit

public enum Metrics {
    public enum Spacing {
        /// CGFloat = 2
        public static let micro: CGFloat = 2
        /// CGFloat = 4
        public static let tiny: CGFloat = 4
        /// CGFloat = 6
        public static let xxxSmall: CGFloat = 6
        /// CGFloat = 8
        public static let xxSmall: CGFloat = 8
        /// CGFloat = 12
        public static let xSmall: CGFloat = 12
        /// CGFloat = 16
        public static let small: CGFloat = 16
        /// CGFloat = 24
        public static let base: CGFloat = 24
        /// CGFloat = 32
        public static let medium: CGFloat = 32
        /// CGFloat = 48
        public static let large: CGFloat = 48
        /// CGFloat = 64
        public static let xLarge: CGFloat = 64
    }
}

extension Metrics {
    public enum FontSize {
        /// CGFloat = 48
        case headline
        /// CGFloat = 24
        case title
        /// CGFloat = 22
        case xTitle
        /// CGFloat = 16
        case xSubtitle
        /// CGFloat = 18
        case subtitle
        /// CGFloat = 14
        case body
        /// CGFloat = 12
        case caption
        /// CGFloat = 11
        case captionTiny
        /// CGFloat = 10
        case itemLabel

        public var value: CGFloat {
            switch self {
            case .headline:
                return 48
            case .title:
                return 24
            case .xTitle:
                return 22
            case .xSubtitle:
                return 16
            case .subtitle:
                return 18
            case .body:
                return 14
            case .caption:
                return 12
            case .captionTiny:
                return 11
            case .itemLabel:
                return 10
            }
        }
    }
}

extension Metrics {
    public enum CornerRadius {
        /// Corner radius CGFloat `2`
        public static let nano: CGFloat = 2
        /// Corner radius CGFloat `4`
        public static let micro: CGFloat = 4
        /// Corner radius CGFloat `8`
        public static let tiny: CGFloat = 8
        /// Corner radius CGFloat `16`
        public static let base: CGFloat = 16
    }
}

extension Metrics {
    public enum LayoutSize {
        /// CGFloat = 1
        public static let nano: CGFloat = 1
        /// CGFloat = 2
        public static let micro: CGFloat = 2
        /// CGFloat = 16
        public static let small: CGFloat = 16
        /// CGFloat = 24
        public static let base: CGFloat = 24
        /// CGFloat = 32
        public static let medium: CGFloat = 32
        /// CGFloat = 40
        public static let large: CGFloat = 40
        /// CGFloat = 50
        public static let xLarge: CGFloat = 50
        /// CGFloat = 44
        public static let touchable: CGFloat = 44
        /// CGFloat = 100
        public static let gigant: CGFloat = 100
        /// CGFloat = 75
        public static let big: CGFloat = 75
        /// CGFloat = 120
        public static let xgigant: CGFloat = 120
    }
}
