//
//  ArpButton.swift
//  AudioKitSynthOne
//
//  Created by AudioKit Contributors on 8/1/17.
//  Copyright © 2018 AudioKit. All rights reserved.
//

import UIKit

@IBDesignable
class ArpButton: UIView {

    // MARK: - ToggleButton
    var isOn: Bool {
        get {
            return value == 1
        }
        set {
            value = newValue ? 1:0
        }
    }

    private var _value: Double = 0
    var value: Double {
        get {
            return _value
        }
        set {
            if newValue > 0 {
                _value = 1
            } else {
                _value = 0
            }
            setNeedsDisplay()
        }
    }

    public var callback: (Double) -> Void = { _ in }

    override func draw(_ rect: CGRect) {
        ArpButtonStyleKit.drawArpButton(isToggled: value > 0 ? true : false)
    }

    // MARK: - Handle Touches

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches {
            value = 1 - value
            callback(value)
        }
    }
}
