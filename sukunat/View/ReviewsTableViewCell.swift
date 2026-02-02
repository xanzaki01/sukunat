//
//  ReviewsTableViewCell.swift
//  sukunat
//
//  Created by Xan Xanzaki on 23/12/25.
//

import UIKit
class ReviewsTableViewCell: UITableViewCell {
    
    static let identifier = "ReviewsTableViewCell"
    
    private var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 250/255, green: 247/255, blue: 242/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person.circle")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Cochin", size: 20)
        label.text = "7__nurmuhamamd__7"
        label.textColor = .label
        return label
    }()
    private let starsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Cochin", size: 20)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        setUPUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUPUI(){
        contentView.addSubview(cardView)
        cardView.addSubview(avatarImageView)
        cardView.addSubview(nameLabel)
        cardView.addSubview(starsStackView)
        cardView.addSubview(commentLabel)
        
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        cardView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        cardView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        avatarImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10).isActive = true
        avatarImageView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 10).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 10).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
        
        starsStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        starsStackView.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 10).isActive = true
        
        commentLabel.topAnchor.constraint(equalTo: starsStackView.bottomAnchor, constant: 10).isActive = true
        commentLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 10).isActive = true
        commentLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10).isActive = true
    }
    
    func configure(_ review: Reviews){
        nameLabel.text = review.author
        commentLabel.text = review.comment
        setUPStairs(rating: review.rating)
        
    }
    private func setUPStairs(rating: Int){
        starsStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
        
        for index in 0...5{
            let imageName = index <= rating ? "star.fill" : "star"
            let star = UIImageView(image: UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate))
            star.tintColor = .systemYellow
            star.contentMode = .scaleAspectFit
            starsStackView.addArrangedSubview(star)
        }
    }
    
}
