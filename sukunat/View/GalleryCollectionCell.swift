//
//  GalleryCollectionCell.swift
//  sukunat
//
//  Created by Xan Xanzaki on 24/12/25.
//

import UIKit
class GalleryCollectionCell: UICollectionViewCell {
    
    static let identifier = "GalleryCollectionCell"
    
    lazy var galleryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        setUPUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUPUI(){
        contentView.addSubview(galleryImage)
        
        galleryImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        galleryImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        galleryImage.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        galleryImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    func configure(_ image: Gallery){
        galleryImage.image = image.image
    }
}
