//
//  MovieWatched+CoreDataProperties.swift
//  MovieRoll
//
//  Created by Bruno Bezerra on 25/06/22.
//
//

import Foundation
import CoreData


extension MovieWatched {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieWatched> {
        return NSFetchRequest<MovieWatched>(entityName: "MovieWatched")
    }

    @NSManaged public var genreIds: [Int]?
    @NSManaged public var id: Int32
    @NSManaged public var overview: String?
    @NSManaged public var posterImage: Data?
    @NSManaged public var providersId: [Int]?
    @NSManaged public var releaseDate: String?
    @NSManaged public var title: String?
    @NSManaged public var voteAverage: Float

}

extension MovieWatched : Identifiable {

}
