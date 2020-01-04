//
//  Optional+Extension.swift
//  EasyEnglish
//
//  Created by Ihor Mostovyi on 04.01.2020.
//  Copyright © 2020 Мостовий Ігор. All rights reserved.
//

public extension Optional {
    func or(_ value: @autoclosure () -> Wrapped) -> Wrapped {
        return self ?? value()
    }
}
