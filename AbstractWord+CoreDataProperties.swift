//
//  AbstractWord+CoreDataProperties.swift
//  EasyEnglish
//
//  Created by Ihor Mostoviy on 08.01.2020.
//  Copyright © 2020 Мостовий Ігор. All rights reserved.
//
//

import Foundation
import CoreData

extension AbstractWord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AbstractWord> {
        return NSFetchRequest<AbstractWord>(entityName: "AbstractWord")
    }

    @NSManaged public var pictureURL: URL?
    @NSManaged public var transcription: String?
    @NSManaged public var translationRU: String?
    @NSManaged public var translationUA: String?
    @NSManaged public var videoURL: String?
    @NSManaged public var wordDescription: String?
    @NSManaged public var word: String?

}
