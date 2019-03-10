//
//  Application.swift
//  Feedback
//
//  Created by flexih on 2019/3/10.
//  Copyright © 2019 flexih. All rights reserved.
//

import UIKit

class Application: UIApplication {
    
    override func sendAction(_ action: Selector, to target: Any?, from sender: Any?, for event: UIEvent?) -> Bool {
        let sent = super.sendAction(action, to: target, from: sender, for: event)
        if sent, let object = sender as? Feedbackable, object.fb_on {
            object.fb_vibrate()
        }
        return sent
    }
    
    override func sendEvent(_ event: UIEvent) {
        if event.type == .touches, let touch = event.allTouches?.first, touch.phase == .began, let object = touch.view as? Feedbackable, object.fb_on {
            object.fb_prepare()
        }
        super.sendEvent(event)
    }
    
}
