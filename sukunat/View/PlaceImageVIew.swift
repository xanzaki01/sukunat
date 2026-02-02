//
//  PlaceImageVIew.swift
//  sukunat
//
//  Created by Xan Xanzaki on 26/11/25.
//

import UIKit
class PlaceImageView: UIView{
    
    let gradientLayer = CAGradientLayer()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()

    lazy var locationName: UILabel = {
        let label = UILabel()
        label.text = "Nadi Fuji"
        label.textColor = .white
        label.font = UIFont(name: "Cochin", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    lazy var placeName: UILabel = {
        let label = UILabel()
        label.text = "Tavarua Island"
        label.textColor = .white
        label.font = UIFont(name: "Cochin", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 30
        
        backgroundColor = UIColor(hex: "#636CCB")
        clipsToBounds = true
        setUPUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    private func setUPUI(){
        addSubview(imageView)

        addSubview(placeName)
        addSubview(locationName)
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        placeName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        placeName.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        locationName.bottomAnchor.constraint(equalTo: placeName.topAnchor, constant: -5).isActive = true
        locationName.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
    }
}
