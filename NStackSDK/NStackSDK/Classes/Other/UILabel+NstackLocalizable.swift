//
//  UILabel+NstackLocalizable.swift
//  NStackSDK
//
//  Created by Nicolai Harbo on 30/07/2019.
//  Copyright © 2019 Nodes ApS. All rights reserved.
//

import Foundation
import UIKit

extension UILabel: NStackLocalizable {
    
    private static var _backgroundColor = [String: UIColor?]()
    private static var _userInteractionEnabled = [String:Bool]()
    private static var _section = [String:String]()
    private static var _key = [String:String]()
    
    @objc public func localize(for key: String) {
        NStack.sharedInstance.translationsManager?.localize(component: self, for: key)
    }
    
    @objc public func setLocalizedValue(_ localizedValue: String) {
        text = localizedValue
    }
    
    public var translatableValue: String? {
        get {
            return text
        }
        set {
            text = newValue
        }
    }
    
    public var section: String? {
        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return UILabel._section[tmpAddress]
        }
        set {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            UILabel._section[tmpAddress] = newValue
        }
    }
    
    public var key: String? {
        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return UILabel._key[tmpAddress]
        }
        set {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            UILabel._key[tmpAddress] = newValue
        }
    }
    
    public var originalBackgroundColor: UIColor? {
        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return UILabel._backgroundColor[tmpAddress] ?? .clear
        }
        set {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            UILabel._backgroundColor[tmpAddress] = newValue
        }
    }
    
    public var originalIsUserInteractionEnabled: Bool {
        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return UILabel._userInteractionEnabled[tmpAddress] ?? false
        }
        set {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            UILabel._userInteractionEnabled[tmpAddress] = newValue
        }
    }
    
    public var backgroundViewToColor: UIView? {
        return self
    }
    
}
