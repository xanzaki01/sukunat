//
//  RecommendationCell.swift
//  sukunat
//
//  Created by Xan Xanzaki on 21/11/25.
//

import UIKit

class RecommendationCell: UICollectionViewCell {
    
    static let identifier = "RecommendationCell"
    
    lazy var recommendationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor(hex: "#50589C").withAlphaComponent(0.15).cgColor

        
        contentView.addSubview(recommendationLabel)
        
        recommendationLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        recommendationLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        recommendationLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(text: String, isSelected: Bool) {
        recommendationLabel.text = text

        if isSelected {
            contentView.backgroundColor = UIColor(hex: "#50589C")
            recommendationLabel.textColor = .white
        } else {
            contentView.backgroundColor = UIColor(hex: "#636CCB").withAlphaComponent(0.2)
            recommendationLabel.textColor = UIColor(hex: "#3C467B")
        }
    }

    
}
