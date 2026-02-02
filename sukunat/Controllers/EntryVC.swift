//
//  EntryVC.swift
//  sukunat
//
//  Created by Xan Xanzaki on 19/11/25.
//

import UIKit
class EntryVC: UIViewController{
    
    lazy var entryImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "sukunat")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    lazy var entryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.setTitle("Search Destination", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 80/255, green: 88/255, blue: 156/255, alpha: 1)
        button.layer.shadowColor = UIColor(red: 60/255, green: 70/255, blue: 123/255, alpha: 1).cgColor
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 6)
        button.addTarget(self, action: #selector(entryTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUPUI()
        
    }
    @objc func entryTapped(_ sender: UIButton){
        let vc = TABVC()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    private func setUPUI(){
        view.addSubview(entryImage)
        view.addSubview(entryButton)
        
        entryImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        entryImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        entryImage.widthAnchor.constraint(equalToConstant: 500).isActive = true
        entryImage.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        entryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        entryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        entryButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        entryButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
    }
}
