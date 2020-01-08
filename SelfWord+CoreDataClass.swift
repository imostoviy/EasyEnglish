//
//  SelfWord+CoreDataClass.swift
//  EasyEnglish
//
//  Created by Ihor Mostoviy on 08.01.2020.
//  Copyright © 2020 Мостовий Ігор. All rights reserved.
//
//

import Foundation
import CoreData

@objc(SelfWord)
public class SelfWord: AbstractWord {
    class func fetchAll() -> [SelfWord] {
        let context = CoreDataStack.shared.persistantContainer.viewContext
        let request: NSFetchRequest = fetchRequest()
        var words: [SelfWord] = []

        do {
            try words = context.fetch(request)
        } catch {
            debugPrint(error)
        }
        return words
    }
}
