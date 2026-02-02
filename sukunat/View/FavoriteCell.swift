//
//  FavoriteCell.swift
//  sukunat
//
//  Created by Xan Xanzaki on 25/11/25.
//

import UIKit
class FavoriteCell: UITableViewCell {
    
    static let identifier = "FavoriteCell"
    
    let shadowView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor(hex: "#3C467B").cgColor
        view.layer.shadowOpacity = 0.12
        view.layer.shadowRadius = 12
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.masksToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        return view
    }()
    
    lazy var favoriteImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.backgroundColor = UIColor(hex: "#636CCB").withAlphaComponent(0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    lazy var favoriteName: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#3C467B")
        label.font = UIFont(name: "Cochin", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Minor Mosque"
        label.numberOfLines = 0
        return label
    }()
    lazy var favoriteLocationName: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#6E8CFB")
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Tashkent"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        setUPUI()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        shadowView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: 10).cgPath
    }
    private func setUPUI(){
        contentView.addSubview(shadowView)
        shadowView.addSubview(containerView)
        containerView.addSubview(favoriteImageView)
        containerView.addSubview(favoriteName)
        containerView.addSubview(favoriteLocationName)
        
        shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        shadowView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        shadowView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        containerView.topAnchor.constraint(equalTo: shadowView.topAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: shadowView.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: shadowView.rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor).isActive = true
        
        favoriteImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        favoriteImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        favoriteImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10).isActive = true
        favoriteImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        favoriteName.topAnchor.constraint(equalTo: favoriteImageView.bottomAnchor, constant: 20).isActive = true
        favoriteName.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        
        favoriteLocationName.topAnchor.constraint(equalTo: favoriteName.bottomAnchor, constant: 5).isActive = true
        favoriteLocationName.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        favoriteLocationName.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
