//
//  Model.swift
//  sukunat
//
//  Created by Xan Xanzaki on 23/11/25.
//

import UIKit

class PlacesModel{
    var placesImage: UIImage?
    var placesNames: String
    var placesLocationName: String
    var category: String
    var type: String
    init(placesImage: UIImage? = nil, placesNames: String, placesLocationName: String, category: String, type: String) {
        self.placesImage = placesImage
        self.placesNames = placesNames
        self.placesLocationName = placesLocationName
        self.category = category
        self.type = type
    }
    
}
class CategoryModel{
    var categoryImage: UIImage?
    var categoryName: String
    var type: String
    init(categoryImage: UIImage? = nil, categoryName: String, type: String) {
        self.categoryImage = categoryImage
        self.categoryName = categoryName
        self.type = type
    }
}
class Route{
    let title: String
    let distance: String
    let duration: String
    
    init(title: String, distance: String, duration: String) {
        self.title = title
        self.distance = distance
        self.duration = duration
    }
}
class Reviews{
    let author: String
    let rating: Int
    let comment: String
    init(author: String, rating: Int, comment: String) {
        self.author = author
        self.rating = rating
        self.comment = comment
    }
}
class Gallery{
    let image: UIImage?
    init(image: UIImage) {
        self.image = image
    }
}
