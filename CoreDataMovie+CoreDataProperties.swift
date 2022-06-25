//
//  CoreDataMovie+CoreDataProperties.swift
//  MovieRoll
//
//  Created by Raul Felippe on 25/06/22.
//
//

import Foundation
import CoreData


extension CoreDataMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataMovie> {
        return NSFetchRequest<CoreDataMovie>(entityName: "CoreDataMovie")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var overview: String?
    @NSManaged public var posterImage: Data?
    @NSManaged public var voteAverage: Float
    @NSManaged public var releaseDate: String?
    @NSManaged public var genreIds: [Int]?
    @NSManaged public var providersId: [Int]?

}

extension CoreDataMovie : Identifiable {

}
