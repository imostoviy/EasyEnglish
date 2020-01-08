//
//  ReusableCell.swift
//  EasyEnglish
//
//  Created by Ihor Mostovyi on 04.01.2020.
//  Copyright © 2020 Мостовий Ігор. All rights reserved.
//

import UIKit

// MARK: - ReusableCell
protocol ReusableCell {
    static var reuseIdentifier: String { get }
}

extension ReusableCell {
    static var reuseIdentifier: String { return String(describing: Self.self) }
}

// MARK: - UICollectionView
extension UICollectionView {
    func dequeueReusableCell<T: ReusableCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

    func registerCell<T: ReusableCell>(_ cellClass: T.Type) {
        let nib = UINib(nibName: cellClass.reuseIdentifier, bundle: Bundle.main)
        register(nib, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }
}

// MARK: - TableView
extension UITableView {
    func dequeueReusableCell<T: ReusableCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

    func dequeueReusableCell<T: ReusableCell>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

    func dequeueReusableHeaderFooterView<T: ReusableCell>() -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not HeaderFooterView cell with identifier: \(T.reuseIdentifier)")
        }
        return view
    }

    func registerCell<T: ReusableCell>(_ cellClass: T.Type) {
        let nib = UINib(nibName: cellClass.reuseIdentifier, bundle: Bundle.main)
        register(nib, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }

    func registerHeaderFooterView<T: ReusableCell>(_ viewClass: T.Type) {
        let nib = UINib(nibName: viewClass.reuseIdentifier, bundle: Bundle.main)
        register(nib, forHeaderFooterViewReuseIdentifier: viewClass.reuseIdentifier)
    }
}
