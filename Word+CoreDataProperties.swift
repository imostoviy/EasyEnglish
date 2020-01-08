//
//  Word+CoreDataProperties.swift
//  EasyEnglish
//
//  Created by Ihor Mostoviy on 08.01.2020.
//  Copyright © 2020 Мостовий Ігор. All rights reserved.
//
//

import Foundation
import CoreData

extension Word {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Word> {
        return NSFetchRequest<Word>(entityName: "Word")
    }

    @NSManaged public var isApproved: Bool
    @NSManaged public var isKnown: Bool

}
