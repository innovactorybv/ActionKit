//
//  UIGestureRecognizer+ActionKit.swift
//  ActionKit
//
//  Created by Kevin Choi, Benjamin Hendricks on 7/17/14.
//  Licensed under the terms of the MIT license
//

import Foundation
import UIKit

public protocol ActionKitGestureRecognizer {}

public extension ActionKitGestureRecognizer where Self: UIGestureRecognizer {
    init(closure: @escaping () -> ()) {
        self.init()
        _addControlEvent(closure: closure)
    }
    
    init(closureWithControl: @escaping (Self) -> ()) {
        self.init()
        addClosure(closureWithControl)
    }
    
    func addClosure(_ closureWithControl: @escaping (Self) -> ()) {
        _addControlEvent(closure: { [weak self] in
            guard let strongSelf = self else { return }
            closureWithControl(strongSelf)
            })
    }
    
    func addClosure(_ closure: @escaping () -> ()) {
        _addControlEvent(closure: closure)
    }
}

extension UIGestureRecognizer: ActionKitGestureRecognizer {}

public extension UIGestureRecognizer {
    fileprivate struct AssociatedKeys {
        static var ActionClosure = 0
    }
    
    fileprivate var ActionClosure: ActionKitVoidClosure? {
        get { return (objc_getAssociatedObject(self, &AssociatedKeys.ActionClosure) as? ActionKitVoidClosureWrapper)?.closure }
        set { objc_setAssociatedObject(self, &AssociatedKeys.ActionClosure, ActionKitVoidClosureWrapper(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)}
    }
    
    @objc fileprivate func runActionKitVoidClosure() {
        ActionClosure?()
    }
    
    fileprivate func _addControlEvent(closure: @escaping () -> ()) {
        ActionClosure = closure
        self.addTarget(self, action: #selector(UIGestureRecognizer.runActionKitVoidClosure))
    }
    
    func removeClosure() {
        ActionClosure = nil
        self.removeTarget(self, action: #selector(UIGestureRecognizer.runActionKitVoidClosure))
    }
}
