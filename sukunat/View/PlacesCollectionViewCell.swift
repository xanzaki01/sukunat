//
//  PlacesCollectionViewCell.swift
//  sukunat
//
//  Created by Xan Xanzaki on 22/11/25.
//

import UIKit
class PlacesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PlacesCollectionViewCell"
    
    lazy var placesImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 40
        image.backgroundColor = UIColor(hex: "#636CCB").withAlphaComponent(0.2)
        return image
    }()
    lazy var placesName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Cochin", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Minor Mosque"
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    lazy var placesLocationName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = UIColor(hex: "#6E8CFB")
        label.text = "Tashkent"
        return label
    }()
    private let gradientLayer = CAGradientLayer()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        contentView.layer.shadowColor = UIColor(hex: "#3C467B").cgColor
        contentView.layer.shadowOpacity = 0.12
        contentView.layer.shadowOffset = CGSize(width: 0, height: 6)
        contentView.layer.shadowRadius = 12
        contentView.layer.masksToBounds = false

        setUPUI()
        
    }
    private func setUPUI(){
        contentView.addSubview(placesImage)
        placesImage.addSubview(placesName)
        placesImage.addSubview(placesLocationName)

        
        placesImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        placesImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        placesImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        placesImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 ).isActive = true
        
        placesName.leftAnchor.constraint(equalTo: placesImage.leftAnchor, constant: 10).isActive = true
        placesName.rightAnchor.constraint(equalTo: placesImage.rightAnchor, constant: -10).isActive = true

        
        placesLocationName.topAnchor.constraint(equalTo: placesName.bottomAnchor, constant: 10).isActive = true
        placesLocationName.leftAnchor.constraint(equalTo: placesImage.leftAnchor, constant: 10).isActive = true
        placesLocationName.bottomAnchor.constraint(equalTo: placesImage.bottomAnchor, constant: -20).isActive = true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = placesImage.bounds
        gradientLayer.cornerRadius = 16
    }

    func configure(image: UIImage, name: String, locationName: String){
        placesImage.image = image
        placesName.text = name
        placesLocationName.text = locationName
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
