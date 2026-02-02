//
//  CategoriesCell.swift
//  sukunat
//
//  Created by Xan Xanzaki on 21/11/25.
//

import UIKit
class CategoriesCell: UITableViewCell {
    
    static let identifier = "CategoriesCell"
    var categoryArray: [CategoryModel] = []
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Categories"
        label.textColor = UIColor(hex: "#3C467B")
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var seeAllButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("See All", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.setTitleColor(UIColor(hex: "#6E8CFB"), for: .normal)
        return button
    }()
    lazy var categoryCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: CategoryCollectionCell.identifier)
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        setUPUI()
        
    }
    private func setUPUI(){
        contentView.addSubview(categoryLabel)
        contentView.addSubview(seeAllButton)
        contentView.addSubview(categoryCollection)
        
        categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        categoryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
//        categoryLabel.bottomAnchor.constraint(equalTo: categoryCollection.topAnchor, constant: 10).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        seeAllButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        seeAllButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        seeAllButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        seeAllButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        categoryCollection.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: -10).isActive = true
        categoryCollection.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        categoryCollection.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        categoryCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        categoryCollection.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CategoriesCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategoryClass.categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.identifier, for: indexPath) as! CategoryCollectionCell
        let categories = CategoryClass.categoryArray[indexPath.row]
        cell.configure(text: categories.categoryName, image: categories.categoryImage!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 120)
    }
    
    
}
