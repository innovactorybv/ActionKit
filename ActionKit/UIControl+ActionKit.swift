//
//  UIControl+ActionKit.swift
//  ActionKit
//
//  Created by Kevin Choi, Benjamin Hendricks on 7/17/14.
//  Licensed under the terms of the MIT license
//

import Foundation
import UIKit

public protocol ActionKitControl {}

public extension ActionKitControl where Self: UIControl {
    func addControlEvent(_ controlEvents: UIControl.Event, closureWithControl: @escaping (Self) -> ()) {
        _addControlEvent(controlEvents, closure: { [weak self] () -> () in
            guard let strongSelf = self else { return }
            closureWithControl(strongSelf)
            })
    }
    
    func addControlEvent(_ controlEvents: UIControl.Event, closure: @escaping () -> ()) {
        _addControlEvent(controlEvents, closure: closure)
    }
}

extension UIControl: ActionKitControl {}

public extension UIControl {
    fileprivate struct AssociatedKeys {
        static var ControlTouchDownClosure = 0
        static var ControlTouchDownRepeatClosure = 0
        static var ControlTouchDragInsideClosure = 0
        static var ControlTouchDragOutsideClosure = 0
        static var ControlTouchDragEnterClosure = 0
        static var ControlTouchDragExitClosure = 0
        static var ControlTouchUpInsideClosure = 0
        static var ControlTouchUpOutsideClosure = 0
        static var ControlTouchCancelClosure = 0
        static var ControlValueChangedClosure = 0
        static var ControlEditingDidBeginClosure = 0
        static var ControlEditingChangedClosure = 0
        static var ControlEditingDidEndClosure = 0
        static var ControlEditingDidEndOnExitClosure = 0
        static var ControlAllTouchEventsClosure = 0
        static var ControlAllEditingEventsClosure = 0
        static var ControlApplicationReservedClosure = 0
        static var ControlSystemReservedClosure = 0
        static var ControlAllEventsClosure = 0
    }
    
    fileprivate func get(_ key: UnsafeRawPointer) -> ActionKitVoidClosure? {
        return (objc_getAssociatedObject(self, key) as? ActionKitVoidClosureWrapper)?.closure
    }
    fileprivate func set(_ key: UnsafeRawPointer, action: ActionKitVoidClosure?) {
        objc_setAssociatedObject(self, key, ActionKitVoidClosureWrapper(action), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    fileprivate var TouchDownClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlTouchDownClosure) }
        set { set(&AssociatedKeys.ControlTouchDownClosure, action: newValue)}
    }
    fileprivate var TouchDownRepeatClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlTouchDownRepeatClosure) }
        set { set(&AssociatedKeys.ControlTouchDownRepeatClosure, action: newValue)}
    }
    fileprivate var TouchDragInsideClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlTouchDragInsideClosure) }
        set { set(&AssociatedKeys.ControlTouchDragInsideClosure, action: newValue)}
    }
    fileprivate var TouchDragOutsideClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlTouchDragOutsideClosure) }
        set { set(&AssociatedKeys.ControlTouchDragOutsideClosure, action: newValue)}
    }
    fileprivate var TouchDragEnterClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlTouchDragEnterClosure) }
        set { set(&AssociatedKeys.ControlTouchDragEnterClosure, action: newValue)}
    }
    fileprivate var TouchDragExitClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlTouchDragExitClosure) }
        set { set(&AssociatedKeys.ControlTouchDragExitClosure, action: newValue)}
    }
    fileprivate var TouchUpInsideClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlTouchUpInsideClosure) }
        set { set(&AssociatedKeys.ControlTouchUpInsideClosure, action: newValue)}
    }
    fileprivate var TouchUpOutsideClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlTouchUpOutsideClosure) }
        set { set(&AssociatedKeys.ControlTouchUpOutsideClosure, action: newValue)}
    }
    fileprivate var TouchCancelClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlTouchCancelClosure) }
        set { set(&AssociatedKeys.ControlTouchCancelClosure, action: newValue)}
    }
    fileprivate var ValueChangedClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlValueChangedClosure) }
        set { set(&AssociatedKeys.ControlValueChangedClosure, action: newValue)}
    }
    fileprivate var EditingDidBeginClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlEditingDidBeginClosure) }
        set { set(&AssociatedKeys.ControlEditingDidBeginClosure, action: newValue)}
    }
    fileprivate var EditingChangedClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlEditingChangedClosure) }
        set { set(&AssociatedKeys.ControlEditingChangedClosure, action: newValue)}
    }
    fileprivate var EditingDidEndClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlEditingDidEndClosure) }
        set { set(&AssociatedKeys.ControlEditingDidEndClosure, action: newValue)}
    }
    fileprivate var EditingDidEndOnExitClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlEditingDidEndOnExitClosure) }
        set { set(&AssociatedKeys.ControlEditingDidEndOnExitClosure, action: newValue)}
    }
    fileprivate var AllTouchEventsClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlAllTouchEventsClosure) }
        set { set(&AssociatedKeys.ControlAllTouchEventsClosure, action: newValue)}
    }
    fileprivate var AllEditingEventsClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlAllEditingEventsClosure) }
        set { set(&AssociatedKeys.ControlAllEditingEventsClosure, action: newValue)}
    }
    fileprivate var ApplicationReservedClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlApplicationReservedClosure) }
        set { set(&AssociatedKeys.ControlApplicationReservedClosure, action: newValue)}
    }
    fileprivate var SystemReservedClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlSystemReservedClosure) }
        set { set(&AssociatedKeys.ControlSystemReservedClosure, action: newValue)}
    }
    fileprivate var AllEventsClosure: ActionKitVoidClosure? {
        get { return get(&AssociatedKeys.ControlAllEventsClosure) }
        set { set(&AssociatedKeys.ControlAllEventsClosure, action: newValue)}
    }
    
    @objc fileprivate func runClosureTouchDown() {
        TouchDownClosure?()
    }
    @objc fileprivate func runClosureTouchDownRepeat() {
        TouchDownRepeatClosure?()
    }
    @objc fileprivate func runClosureTouchDragInside() {
        TouchDragInsideClosure?()
    }
    @objc fileprivate func runClosureTouchDragOutside() {
        TouchDragOutsideClosure?()
    }
    @objc fileprivate func runClosureTouchDragEnter() {
        TouchDragEnterClosure?()
    }
    @objc fileprivate func runClosureTouchDragExit() {
        TouchDragExitClosure?()
    }
    @objc fileprivate func runClosureTouchUpInside() {
        TouchUpInsideClosure?()
    }
    @objc fileprivate func runClosureTouchUpOutside() {
        TouchUpOutsideClosure?()
    }
    @objc fileprivate func runClosureTouchCancel() {
        TouchCancelClosure?()
    }
    @objc fileprivate func runClosureValueChanged() {
        ValueChangedClosure?()
    }
    @objc fileprivate func runClosureEditingDidBegin() {
        EditingDidBeginClosure?()
    }
    @objc fileprivate func runClosureEditingChanged() {
        EditingChangedClosure?()
    }
    @objc fileprivate func runClosureEditingDidEnd() {
        EditingDidEndClosure?()
    }
    @objc fileprivate func runClosureEditingDidEndOnExit() {
        EditingDidEndOnExitClosure?()
    }
    @objc fileprivate func runClosureAllTouchEvents() {
        AllTouchEventsClosure?()
    }
    @objc fileprivate func runClosureAllEditingEvents() {
        AllEditingEventsClosure?()
    }
    @objc fileprivate func runClosureApplicationReserved() {
        ApplicationReservedClosure?()
    }
    @objc fileprivate func runClosureSystemReserved() {
        SystemReservedClosure?()
    }
    @objc fileprivate func runClosureAllEvents() {
        AllEventsClosure?()
    }
    
    fileprivate func _addControlEvent(_ controlEvents: UIControl.Event, closure: @escaping ActionKitVoidClosure) {
        switch controlEvents {
        case let x where x.contains(.touchDown):
            self.TouchDownClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureTouchDown), for: controlEvents)
        case let x where x.contains(.touchDownRepeat):
            self.TouchDownRepeatClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureTouchDownRepeat), for: controlEvents)
        case let x where x.contains(.touchDragInside):
            self.TouchDragInsideClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureTouchDragInside), for: controlEvents)
        case let x where x.contains(.touchDragOutside):
            self.TouchDragOutsideClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureTouchDragOutside), for: controlEvents)
        case let x where x.contains(.touchDragEnter):
            self.TouchDragEnterClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureTouchDragEnter), for: controlEvents)
        case let x where x.contains(.touchDragExit):
            self.TouchDragExitClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureTouchDragExit), for: controlEvents)
        case let x where x.contains(.touchUpInside):
            self.TouchUpInsideClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureTouchUpInside), for: controlEvents)
        case let x where x.contains(.touchUpOutside):
            self.TouchUpOutsideClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureTouchUpOutside), for: controlEvents)
        case let x where x.contains(.touchCancel):
            self.TouchCancelClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureTouchCancel), for: controlEvents)
        case let x where x.contains(.valueChanged):
            self.ValueChangedClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureValueChanged), for: controlEvents)
        case let x where x.contains(.editingDidBegin):
            self.EditingDidBeginClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureEditingDidBegin), for: controlEvents)
        case let x where x.contains(.editingChanged):
            self.EditingChangedClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureEditingChanged), for: controlEvents)
        case let x where x.contains(.editingDidEnd):
            self.EditingDidEndClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureEditingDidEnd), for: controlEvents)
        case let x where x.contains(.editingDidEndOnExit):
            self.EditingDidEndOnExitClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureEditingDidEndOnExit), for: controlEvents)
        case let x where x.contains(.allTouchEvents):
            self.AllTouchEventsClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureAllTouchEvents), for: controlEvents)
        case let x where x.contains(.allEditingEvents):
            self.AllEditingEventsClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureAllEditingEvents), for: controlEvents)
        case let x where x.contains(.applicationReserved):
            self.ApplicationReservedClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureApplicationReserved), for: controlEvents)
        case let x where x.contains(.systemReserved):
            self.SystemReservedClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureSystemReserved), for: controlEvents)
        case let x where x.contains(.allEvents):
            self.AllEventsClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureAllEvents), for: controlEvents)
        default:
            self.TouchUpInsideClosure = closure
            self.addTarget(self, action: #selector(UIControl.runClosureTouchUpInside), for: controlEvents)
        }
    }
    
    func removeControlEvent(_ controlEvents: UIControl.Event) {
        switch controlEvents {
        case let x where x.contains(.touchDown):
            self.TouchDownClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureTouchDown), for: controlEvents)
        case let x where x.contains(.touchDownRepeat):
            self.TouchDownRepeatClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureTouchDownRepeat), for: controlEvents)
        case let x where x.contains(.touchDragInside):
            self.TouchDragInsideClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureTouchDragInside), for: controlEvents)
        case let x where x.contains(.touchDragOutside):
            self.TouchDragOutsideClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureTouchDragOutside), for: controlEvents)
        case let x where x.contains(.touchDragEnter):
            self.TouchDragEnterClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureTouchDragEnter), for: controlEvents)
        case let x where x.contains(.touchDragExit):
            self.TouchDragExitClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureTouchDragExit), for: controlEvents)
        case let x where x.contains(.touchUpInside):
            self.TouchUpInsideClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureTouchUpInside), for: controlEvents)
        case let x where x.contains(.touchUpOutside):
            self.TouchUpOutsideClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureTouchUpOutside), for: controlEvents)
        case let x where x.contains(.touchCancel):
            self.TouchCancelClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureTouchCancel), for: controlEvents)
        case let x where x.contains(.valueChanged):
            self.ValueChangedClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureValueChanged), for: controlEvents)
        case let x where x.contains(.editingDidBegin):
            self.EditingDidBeginClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureEditingDidBegin), for: controlEvents)
        case let x where x.contains(.editingChanged):
            self.EditingChangedClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureEditingChanged), for: controlEvents)
        case let x where x.contains(.editingDidEnd):
            self.EditingDidEndClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureEditingDidEnd), for: controlEvents)
        case let x where x.contains(.editingDidEndOnExit):
            self.EditingDidEndOnExitClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureEditingDidEndOnExit), for: controlEvents)
        case let x where x.contains(.allTouchEvents):
            self.AllTouchEventsClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureAllTouchEvents), for: controlEvents)
        case let x where x.contains(.allEditingEvents):
            self.AllEditingEventsClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureAllEditingEvents), for: controlEvents)
        case let x where x.contains(.applicationReserved):
            self.ApplicationReservedClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureApplicationReserved), for: controlEvents)
        case let x where x.contains(.systemReserved):
            self.SystemReservedClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureSystemReserved), for: controlEvents)
        case let x where x.contains(.allEvents):
            self.AllEventsClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureAllEvents), for: controlEvents)
        default:
            self.TouchUpInsideClosure = nil
            self.removeTarget(self, action: #selector(UIControl.runClosureTouchUpInside), for: controlEvents)
        }
    }
}
