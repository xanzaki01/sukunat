//
//  PlacesViewCell.swift
//  sukunat
//
//  Created by Xan Xanzaki on 21/11/25.
//

import UIKit
class PlacesViewCell: UITableViewCell{
    
    // MARK: - VARIABLES
    static let identifier = "PlacesViewCell"
    var selectedIndex = 0
    
    let recommendationArray = ["All","Popular","Recommendations","Libraries","Botanical Gardens","Museums","Bookstores","Mosques","Parks", "Cafés","Mountains","Coworking centers","Small Villages"]
    var filteredArray: [PlacesModel] = []
    
    
    // MARK: -UICOMPONENTS
    
    lazy var recommendationCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(RecommendationCell.self, forCellWithReuseIdentifier: RecommendationCell.identifier)
        return collectionView
    }()
    
    lazy var placesCollectionView: UICollectionView = {
        let layout  = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        view.register(PlacesCollectionViewCell.self, forCellWithReuseIdentifier: PlacesCollectionViewCell.identifier)
        return view
    }()
    // MARK: - LIFECYCLE
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .clear
        contentView.layer.shadowColor = UIColor(red: 60/255, green: 70/255, blue: 123/255, alpha: 1).cgColor
        contentView.layer.shadowOpacity = 0.08
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowRadius = 10
        filteredArray = PlacesClass.placesArray
        setUPUI()
        
    }
    // MARK: - SETUPUI
    private func setUPUI(){
        contentView.addSubview(recommendationCollection)
        contentView.addSubview(placesCollectionView)
        
        recommendationCollection.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        recommendationCollection.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        recommendationCollection.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
//        recommendationCollection.bottomAnchor.constraint(equalTo: placesCollectionView.topAnchor, constant: -10).isActive = true
        recommendationCollection.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        placesCollectionView.topAnchor.constraint(equalTo: recommendationCollection.bottomAnchor, constant: 10).isActive = true
        placesCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        placesCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        placesCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        placesCollectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        func filterPlace(selected: String){
            if selected == "All"{
                filteredArray = PlacesClass.placesArray
            }else if selected == "Popular" || selected == "Recommendations"{
                filteredArray = PlacesClass.placesArray.filter{ $0 .category == selected}
            }
            else{
                filteredArray = PlacesClass.placesArray.filter{ $0.type == selected}
            }
            placesCollectionView.reloadData()
        }
}
// MARK: - COLLECTION VIEW FUNCTIONS
extension PlacesViewCell:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == recommendationCollection{
            return recommendationArray.count
        }else{
            return filteredArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == recommendationCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendationCell.identifier, for: indexPath) as! RecommendationCell
            cell.configure(text: recommendationArray[indexPath.item], isSelected: selectedIndex == indexPath.row)
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlacesCollectionViewCell.identifier, for: indexPath) as! PlacesCollectionViewCell
            let place = filteredArray[indexPath.item]
            cell.configure(image: place.placesImage!, name: place.placesNames, locationName: place.placesLocationName)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == recommendationCollection{
            selectedIndex = indexPath.row
            recommendationCollection.reloadData()
            recommendationCollection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
            let selectedCategory = recommendationArray[indexPath.row]
            filterPlace(selected: selectedCategory)
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == placesCollectionView{
            return CGSize(width: 200, height: 250)
        }
        else{
            return CGSize(width: 100, height: 50)
        }
    }
    
}
