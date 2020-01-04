//
//  UIStoryboardLoadable.swift
//  EasyEnglish
//
//  Created by Ihor Mostovyi on 04.01.2020.
//  Copyright © 2020 Мостовий Ігор. All rights reserved.
//

import UIKit

protocol UIStoryboardLoadable: class {
    static var storyboardIdentifier: String { get }
    static var storyboardName: String { get }

    static func loadFromStoryboard(name: String?) -> Self
}

extension UIStoryboardLoadable where Self: UIViewController {
    static var storyboardIdentifier: String { return String(describing: Self.self) }
    static var storyboardName: String { return String(describing: Self.self) }

    static func loadFromStoryboard(name: String? = nil) -> Self {
        let storyboard = UIStoryboard(name: name.or(storyboardName), bundle: nil)

        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("UIStoryboardLoadable: can not load viewcontroller with identifier '\(storyboardIdentifier)' from storyboard.")
        }
        return viewController
    }
}
