//
//  TABVC.swift
//  sukunat
//
//  Created by Xan Xanzaki on 20/11/25.
//

import UIKit
class TABVC: UITabBarController {
    
    let tabbarView = UIView()
    let tabbarItemBackgroundView = UIView()
    
    var buttons: [UIButton] = []
    var centerConstraint: NSLayoutConstraint?
    
    // MARK: -LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        generateControllers()
        setView()
    }
    
    @objc func buttonsClicked(_ sender: UIButton) {
        selectedIndex = sender.tag
        
        centerConstraint?.isActive = false
        centerConstraint = tabbarItemBackgroundView.centerXAnchor.constraint(equalTo: sender.centerXAnchor)
        centerConstraint?.isActive = true
        
        for button in buttons {
            button.tintColor = UIColor(hex: "#636CCB").withAlphaComponent(0.5)
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState, animations: {
            self.centerConstraint?.isActive = false
            self.centerConstraint = self.tabbarItemBackgroundView.centerXAnchor.constraint(equalTo: self.buttons[sender.tag].centerXAnchor)
            self.centerConstraint?.isActive = true
            self.buttons[sender.tag].tintColor = UIColor(hex: "#50589C")
            self.tabbarView.layoutIfNeeded()
            
            self.selectedViewController = self.viewControllers?[self.selectedIndex]
        })
        UIView.animate(withDuration: 0.25) {
            sender.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        } completion: { _ in
            UIView.animate(withDuration: 0.25) {
                sender.transform = .identity
            }
        }
        
    }
    private func setView() {
        view.addSubview(tabbarView)
        tabbarView.backgroundColor = UIColor(hex: "#636CCB").withAlphaComponent(0.15)
        tabbarView.translatesAutoresizingMaskIntoConstraints = false
        tabbarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        tabbarView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60).isActive = true
        tabbarView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        tabbarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tabbarView.layer.cornerRadius = 30
        
        // Ensure the buttons array is not empty
        if buttons.isEmpty {
            print("buttons array is empty")
            return
        }
        
        tabbarView.addSubview(tabbarItemBackgroundView)
        tabbarItemBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        tabbarItemBackgroundView.widthAnchor.constraint(equalTo: tabbarView.widthAnchor, multiplier: 1/CGFloat(buttons.count), constant: -10).isActive = true
        tabbarItemBackgroundView.heightAnchor.constraint(equalTo: tabbarView.heightAnchor, constant: -10).isActive = true
        tabbarItemBackgroundView.centerYAnchor.constraint(equalTo: tabbarView.centerYAnchor).isActive = true
        tabbarItemBackgroundView.layer.cornerRadius = 25
        tabbarItemBackgroundView.backgroundColor = .white
        tabbarItemBackgroundView.layer.shadowColor = UIColor(hex: "#3C467B").cgColor
        tabbarItemBackgroundView.layer.shadowOpacity = 0.12
        tabbarItemBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 4)
        tabbarItemBackgroundView.layer.shadowRadius = 6
        
        
        // Add buttons to the tabbarView
        for i in 0..<buttons.count {
            let button = buttons[i]
            tabbarView.addSubview(button)
            button.tag = i
            button.translatesAutoresizingMaskIntoConstraints = false
            button.centerYAnchor.constraint(equalTo: tabbarView.centerYAnchor).isActive = true
            button.widthAnchor.constraint(equalTo: tabbarView.widthAnchor, multiplier: 1/CGFloat(buttons.count)).isActive = true
            button.heightAnchor.constraint(equalTo: tabbarView.heightAnchor).isActive = true
            button.addTarget(self, action: #selector(buttonsClicked), for: .touchUpInside)
            
            // Set the button's position
            if i == 0 {
                button.leftAnchor.constraint(equalTo: tabbarView.leftAnchor).isActive = true
            } else {
                button.leftAnchor.constraint(equalTo: buttons[i - 1].rightAnchor).isActive = true
            }
        }
        
        // Initially set the center constraint for the background view
        if let firstButton = buttons.first {
            centerConstraint = tabbarItemBackgroundView.centerXAnchor.constraint(equalTo: firstButton.centerXAnchor)
            centerConstraint?.isActive = true
            firstButton.tintColor = UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1)
        }
    }
    
    private func generateControllers() {
        let mainMenu = generateViewControllers(image: UIImage(named: "home-2")!, vc: ViewController())
        let mapView = generateViewControllers(image: UIImage(named: "travelling")!, vc: MapVC())
        let favourite = generateViewControllers(image: UIImage(named: "heart")!, vc: FavoriteVC())
        viewControllers = [mainMenu, mapView, favourite]
    }
    
    private func generateViewControllers(image: UIImage, vc: UIViewController) -> UIViewController {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .lightGray
        
        let images = image.resize(targetSize: CGSize(width: 25, height: 25)).withRenderingMode(.alwaysTemplate)
        button.setImage(images, for: .normal)
        buttons.append(button)
        
        let navigationController = UINavigationController(rootViewController: vc)
        
        return navigationController
    }
}

extension UIImage {
    func resize(targetSize: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: targetSize).image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}
