//
//  SelfWord+CoreDataProperties.swift
//  EasyEnglish
//
//  Created by Ihor Mostoviy on 08.01.2020.
//  Copyright © 2020 Мостовий Ігор. All rights reserved.
//
//

import Foundation
import CoreData

extension SelfWord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SelfWord> {
        return NSFetchRequest<SelfWord>(entityName: "SelfWord")
    }

}
