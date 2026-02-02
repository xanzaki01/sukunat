//
//  CategoryCollectionCell.swift
//  sukunat
//
//  Created by Xan Xanzaki on 24/11/25.
//

import UIKit
class CategoryCollectionCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    lazy var categoryImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 40
        view.backgroundColor = UIColor(hex: "#636CCB").withAlphaComponent(0.2)
        return view
    }()
    lazy var categoryLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(hex: "#3C467B")
        view.font = .systemFont(ofSize: 15, weight: .medium)
        view.text = "BLABLALBla"
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 16
        contentView.layer.shadowColor = UIColor(hex: "#3C467B").cgColor
        contentView.layer.shadowOpacity = 0.08
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowRadius = 8
        setUPUI()
    }
    func configure(text: String, image: UIImage){
        categoryImageView.image = image
        categoryLabel.text = text
    }
    private func setUPUI(){
        contentView.addSubview(categoryImageView)
        contentView.addSubview(categoryLabel)
        
        categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        categoryImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        categoryImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        categoryImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        categoryImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        categoryLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 10).isActive = true
        categoryLabel.centerXAnchor.constraint(equalTo: categoryImageView.centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
