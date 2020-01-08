//
//  Word+CoreDataClass.swift
//  EasyEnglish
//
//  Created by Ihor Mostoviy on 08.01.2020.
//  Copyright © 2020 Мостовий Ігор. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Word)
public class Word: AbstractWord {
    class func fetchAll() -> [Word] {
        let context: NSManagedObjectContext = CoreDataStack.shared.persistantContainer.viewContext
        let request: NSFetchRequest = fetchRequest()
        var words: [Word] = []

        do {
            words = try context.fetch(request)
        } catch {
            debugPrint(error)
        }
        return words
    }
}
