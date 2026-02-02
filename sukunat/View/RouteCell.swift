//
//  RouteCell.swift
//  sukunat
//
//  Created by Xan Xanzaki on 22/12/25.
//

import UIKit
class RouteCell: UITableViewCell{
    
    static let identifier = "RouteCell"
    
    lazy var routeImage: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.image = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysTemplate)
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var routeTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Cochin", size: 20)
        label.text = "Amir Temur street"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var routeInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Cochin", size: 15)
        label.text = "12 km | 20 min"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        setUPUI()
    }
    private func setUPUI(){
        contentView.addSubview(routeImage)
        contentView.addSubview(routeTitle)
        contentView.addSubview(routeInfoLabel)
        
        routeTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        routeTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        
        routeImage.leftAnchor.constraint(equalTo: routeTitle.rightAnchor, constant: 10).isActive = true
        routeImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        routeImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        routeImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        routeInfoLabel.topAnchor.constraint(equalTo: routeTitle.bottomAnchor, constant: 5).isActive = true
        routeInfoLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        routeInfoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
    }
    func configure(_ route: Route){
        routeTitle.text = route.title
        routeInfoLabel.text = "\(route.distance) km | \(route.duration) min"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
