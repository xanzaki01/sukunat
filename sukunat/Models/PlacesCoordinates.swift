//
//  PlacesCoordinates.swift
//  sukunat
//
//  Created by Xan Xanzaki on 16/03/26.
//

import Foundation

class PlaceCoordinateModel {

    var placeName: String
    var latitude: Double
    var longitude: Double

    init(placeName: String, latitude: Double, longitude: Double) {
        self.placeName = placeName
        self.latitude = latitude
        self.longitude = longitude
    }

}
let placesCoordinates: [PlaceCoordinateModel] = [

PlaceCoordinateModel(placeName: "National Library of Uzbekistan", latitude: 41.3167, longitude: 69.2728),
PlaceCoordinateModel(placeName: "Tashkent State Institute Library", latitude: 41.3112, longitude: 69.2795),
PlaceCoordinateModel(placeName: "Samarkand Regional Library", latitude: 39.6542, longitude: 66.9597),
PlaceCoordinateModel(placeName: "Bukhara Regional Scientific Library", latitude: 39.7747, longitude: 64.4286),
PlaceCoordinateModel(placeName: "Fergana Regional Library", latitude: 40.3864, longitude: 71.7843),
PlaceCoordinateModel(placeName: "Namangan Regional Library", latitude: 40.9983, longitude: 71.6726),
PlaceCoordinateModel(placeName: "Nukus Karakalpakstan Library", latitude: 42.4602, longitude: 59.6166),

PlaceCoordinateModel(placeName: "Tashkent Botanical Garden", latitude: 41.3385, longitude: 69.3349),
PlaceCoordinateModel(placeName: "Fergana Botanical Park", latitude: 40.3895, longitude: 71.7870),
PlaceCoordinateModel(placeName: "Andijan Green Park", latitude: 40.7821, longitude: 72.3442),
PlaceCoordinateModel(placeName: "Nukus Botanical Area", latitude: 42.4630, longitude: 59.6110),
PlaceCoordinateModel(placeName: "Urgench Botanical Green Area", latitude: 41.5500, longitude: 60.6333),
PlaceCoordinateModel(placeName: "Bukhara Green Garden", latitude: 39.7675, longitude: 64.4231),

PlaceCoordinateModel(placeName: "State Museum of History of Uzbekistan", latitude: 41.3111, longitude: 69.2797),
PlaceCoordinateModel(placeName: "Savitsky Art Museum", latitude: 42.4637, longitude: 59.6170),
PlaceCoordinateModel(placeName: "Afrasiab Museum", latitude: 39.6683, longitude: 66.9933),
PlaceCoordinateModel(placeName: "Gur-e-Amir Museum", latitude: 39.6547, longitude: 66.9749),
PlaceCoordinateModel(placeName: "Bukhara Ark Museum", latitude: 39.7747, longitude: 64.4150),
PlaceCoordinateModel(placeName: "Andijan Regional Museum", latitude: 40.7825, longitude: 72.3440),
PlaceCoordinateModel(placeName: "Khiva Ichan Kala Museum Complex", latitude: 41.3783, longitude: 60.3639),
PlaceCoordinateModel(placeName: "Fergana Regional Museum", latitude: 40.3864, longitude: 71.7843),
PlaceCoordinateModel(placeName: "Termez Archaeology Museum", latitude: 37.2242, longitude: 67.2783),
PlaceCoordinateModel(placeName: "Tashkent Railway Museum", latitude: 41.2995, longitude: 69.2401),

PlaceCoordinateModel(placeName: "Kitob Olami (Tashkent)", latitude: 41.3115, longitude: 69.2790),
PlaceCoordinateModel(placeName: "Mir Knig Bookstore (Tashkent)", latitude: 41.3043, longitude: 69.2787),
PlaceCoordinateModel(placeName: "Ferghana Book Store", latitude: 40.3891, longitude: 71.7840),
PlaceCoordinateModel(placeName: "Samarkand Book Store", latitude: 39.6542, longitude: 66.9597),
PlaceCoordinateModel(placeName: "Namangan Book Store", latitude: 40.9983, longitude: 71.6726),

PlaceCoordinateModel(placeName: "Minor Mosque", latitude: 41.3353, longitude: 69.2750),
PlaceCoordinateModel(placeName: "Hazrati Imam Complex", latitude: 41.3267, longitude: 69.2453),
PlaceCoordinateModel(placeName: "Kukeldash Mosque", latitude: 41.3244, longitude: 69.2401),
PlaceCoordinateModel(placeName: "Bibi-Khanym Mosque", latitude: 39.6583, longitude: 66.9740),
PlaceCoordinateModel(placeName: "Kalon Mosque", latitude: 39.7744, longitude: 64.4212),
PlaceCoordinateModel(placeName: "Magoki-Attori Mosque", latitude: 39.7740, longitude: 64.4216),
PlaceCoordinateModel(placeName: "Juma Mosque", latitude: 41.3786, longitude: 60.3622),
PlaceCoordinateModel(placeName: "Andijan Jami Mosque", latitude: 40.7826, longitude: 72.3443),
PlaceCoordinateModel(placeName: "Fergana Jome Mosque", latitude: 40.3849, longitude: 71.7863),
PlaceCoordinateModel(placeName: "Namangan Central Mosque", latitude: 41.0000, longitude: 71.6720),

PlaceCoordinateModel(placeName: "Tashkent City Park", latitude: 41.3090, longitude: 69.2406),
PlaceCoordinateModel(placeName: "Central Park", latitude: 41.3152, longitude: 69.2814),
PlaceCoordinateModel(placeName: "Ashgabat Park", latitude: 41.3227, longitude: 69.2995),
PlaceCoordinateModel(placeName: "Amir Temur Park", latitude: 41.3111, longitude: 69.2797),
PlaceCoordinateModel(placeName: "Navoi Park (Samarkand)", latitude: 39.6545, longitude: 66.9605),
PlaceCoordinateModel(placeName: "Sitorai Mokhi-Khosa Garden", latitude: 39.7950, longitude: 64.4410),
PlaceCoordinateModel(placeName: "Khiva Old Town Green Zone", latitude: 41.3783, longitude: 60.3639),
PlaceCoordinateModel(placeName: "Fergana Al-Fergani Park", latitude: 40.3895, longitude: 71.7840),
PlaceCoordinateModel(placeName: "Andijan Bog’i Bobur", latitude: 40.7861, longitude: 72.3440),
PlaceCoordinateModel(placeName: "Nukus Central Park", latitude: 42.4602, longitude: 59.6166),

PlaceCoordinateModel(placeName: "BookCafe", latitude: 41.3117, longitude: 69.2795),
PlaceCoordinateModel(placeName: "Breadly Café", latitude: 41.2953, longitude: 69.2456),
PlaceCoordinateModel(placeName: "Black Bear Café", latitude: 41.3075, longitude: 69.2810),
PlaceCoordinateModel(placeName: "Samarkand Manzara Café", latitude: 39.6549, longitude: 66.9750),
PlaceCoordinateModel(placeName: "Bukhara Silk Road Coffee", latitude: 39.7747, longitude: 64.4210),

PlaceCoordinateModel(placeName: "Chimgan Mountains", latitude: 41.5746, longitude: 70.0290),
PlaceCoordinateModel(placeName: "Beldersay", latitude: 41.5817, longitude: 70.1120),
PlaceCoordinateModel(placeName: "Amirsoy Resort", latitude: 41.5925, longitude: 70.1160),
PlaceCoordinateModel(placeName: "Nanai Mountains", latitude: 41.6030, longitude: 70.0210),
PlaceCoordinateModel(placeName: "Pskem Valley", latitude: 41.8230, longitude: 70.2000),
PlaceCoordinateModel(placeName: "Ugam Range", latitude: 41.7420, longitude: 70.0190),
PlaceCoordinateModel(placeName: "Zaamin National Park (mountain area)", latitude: 39.9600, longitude: 68.3950),
PlaceCoordinateModel(placeName: "Kitab Reserve Mountains", latitude: 39.1330, longitude: 66.8750),
PlaceCoordinateModel(placeName: "Boysun Mountains", latitude: 38.2060, longitude: 67.2060),
PlaceCoordinateModel(placeName: "Hisor Mountain Range", latitude: 38.8000, longitude: 68.5000),

PlaceCoordinateModel(placeName: "CSpace Coworking", latitude: 41.3110, longitude: 69.2800),
PlaceCoordinateModel(placeName: "Ground Zero", latitude: 41.2980, longitude: 69.2730),
PlaceCoordinateModel(placeName: "Impact Hub", latitude: 41.2995, longitude: 69.2401),
PlaceCoordinateModel(placeName: "LOFT Coworking", latitude: 41.3100, longitude: 69.2780),

PlaceCoordinateModel(placeName: "Konigil Village", latitude: 39.6970, longitude: 66.9260),
PlaceCoordinateModel(placeName: "Sentob Village", latitude: 40.6260, longitude: 65.6740),
PlaceCoordinateModel(placeName: "Asraf Village", latitude: 40.5800, longitude: 65.6940),
PlaceCoordinateModel(placeName: "Uhum Village", latitude: 39.7000, longitude: 66.9200),
PlaceCoordinateModel(placeName: "Varakhsha Village", latitude: 39.8000, longitude: 64.3000),
PlaceCoordinateModel(placeName: "Qo‘rg‘ontepa Village", latitude: 40.7320, longitude: 72.7600),
PlaceCoordinateModel(placeName: "Nanay Village", latitude: 41.6100, longitude: 70.0100)

]
