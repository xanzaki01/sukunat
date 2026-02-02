//
//  PlacesdDetailsVC.swift
//  sukunat
//
//  Created by Xan Xanzaki on 26/11/25.
//

import UIKit
class PlacesdDetailsVC: UIViewController{
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.contentInsetAdjustmentBehavior = .never
        return view
    }()
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let placeImageView = PlaceImageView()
    let infoView = InfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUPNavigationBar()
        setUPUI()
    }
    private func setUPNavigationBar(){
        edgesForExtendedLayout = .top
        let apperance = UINavigationBarAppearance()
        apperance.configureWithTransparentBackground()
        apperance.backgroundColor = .clear
        apperance.shadowColor = .clear
        
        let backButton = UIButton()
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .white
        backButton.layer.cornerRadius = 20
        backButton.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        backButton.clipsToBounds = true
        backButton.layer.borderWidth = 1
        backButton.layer.borderColor = UIColor.lightGray.cgColor
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let backBarItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backBarItem
        
        
        let favoriteButton = UIButton()
        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favoriteButton.tintColor = .white
        favoriteButton.layer.cornerRadius = 20
        favoriteButton.clipsToBounds = true
        favoriteButton.layer.borderWidth = 1
        favoriteButton.layer.borderColor = UIColor.lightGray.cgColor
        favoriteButton.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        let favBarItem = UIBarButtonItem(customView: favoriteButton)
        navigationItem.rightBarButtonItem = favBarItem
        
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.hidesBackButton = true
    }
    private func setUPUI(){
        placeImageView.translatesAutoresizingMaskIntoConstraints = false
        infoView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(placeImageView)
        contentView.addSubview(infoView)
        
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        placeImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        placeImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        placeImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        placeImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        infoView.topAnchor.constraint(equalTo: placeImageView.bottomAnchor, constant: 10).isActive = true
        infoView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        infoView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        infoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
}
