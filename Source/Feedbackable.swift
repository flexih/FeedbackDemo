//
//  Feedbackable.swift
//  Feedback
//
//  Created by flexih on 2019/3/10.
//  Copyright © 2019 flexih. All rights reserved.
//

import UIKit

private var fb_styleKey = 1
private var fb_onKey = 1

public protocol Feedbackable {
    var fb_style: UIImpactFeedbackGenerator.FeedbackStyle { get set }
    var fb_on: Bool { get set }
    func fb_vibrate();
    func fb_prepare();
}

extension Feedbackable where Self: UIResponder {
    public var fb_style: UIImpactFeedbackGenerator.FeedbackStyle {
        get {
            return objc_getAssociatedObject(self, &fb_styleKey) as? UIImpactFeedbackGenerator.FeedbackStyle ?? .medium
        }
        set {
            objc_setAssociatedObject(self, &fb_style, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    public var fb_on: Bool {
        get {
            return objc_getAssociatedObject(self, &fb_onKey) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &fb_onKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    public func fb_vibrate() {
        switch fb_style {
        case .heavy:
            ImpactFeedbackGenerator.shared.heavy.impactOccurred()
        case .medium:
            ImpactFeedbackGenerator.shared.medium.impactOccurred()
        case .light:
            ImpactFeedbackGenerator.shared.medium.impactOccurred()            
        }
    }
    public func fb_prepare() {
        switch fb_style {
        case .heavy:
            ImpactFeedbackGenerator.shared.heavy.prepare()
        case .medium:
            ImpactFeedbackGenerator.shared.medium.prepare()
        case .light:
            ImpactFeedbackGenerator.shared.medium.prepare()
        }
    }
}

class ImpactFeedbackGenerator {
    public static let shared = ImpactFeedbackGenerator()
    public lazy var heavy: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    public lazy var medium: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    public lazy var light: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
}
