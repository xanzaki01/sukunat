//
//  ViewController.swift
//  sukunat
//
//  Created by Xan Xanzaki on 17/11/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: -UI COMPONENTS
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.register(PlacesViewCell.self, forCellReuseIdentifier: PlacesViewCell.identifier)
        view.register(CategoriesCell.self, forCellReuseIdentifier: CategoriesCell.identifier)
        return view
    }()
    var searchController = UISearchController(searchResultsController: nil)
    
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.setUPSearchController()
        self.setUPUI()
        
    }
    private func setUPUI(){
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    private func setUPSearchController(){
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.searchTextField.layer.masksToBounds = true
        self.searchController.searchBar.searchTextField.layer.cornerRadius = 18
        
        let textField = self.searchController.searchBar.searchTextField
        textField.backgroundColor = UIColor(red: 99/255, green: 108/255, blue: 203/255, alpha: 1).withAlphaComponent(0.15)
        textField.textColor = UIColor(red: 60/255, green: 70/255, blue: 123/255, alpha: 1)
        textField.tintColor = UIColor(red: 80/255, green: 88/255, blue: 156/255, alpha: 1)
        
        self.searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Searching Destination", attributes: [.foregroundColor: UIColor(red: 60/255, green: 70/255, blue: 123/255, alpha: 1).withAlphaComponent(0.5)])
        
        
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
    }
}
// MARK: -SEARCH CONTROLLER FUNCTION
extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        print("Debug print", searchController.searchBar.text!)
    }
}
// MARK: - TABLE VIEW MAIN FUNCTION
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PlacesViewCell.identifier, for: indexPath) as! PlacesViewCell
            cell.backgroundColor = .clear
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesCell.identifier, for: indexPath) as! CategoriesCell
            cell.backgroundColor = .clear
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: 1)
    }
}

