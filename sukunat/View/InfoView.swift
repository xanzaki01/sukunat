//
//  InfoView.swift
//  sukunat
//
//  Created by Xan Xanzaki on 04/12/25.
//

import UIKit
class InfoView: UIView{
    
    var routes: [Route] = [
        Route(title: "Route A", distance: "12 km", duration: "20 min"),
        Route(title: "Route B", distance: "8 km", duration: "15 min"),
        Route(title: "Route C", distance: "5 km", duration: "10 min")
    ]
    var reviews: [Reviews] = [
        Reviews(author: "Alex", rating: 5, comment: "Amazing route"),
        Reviews(author: "John", rating: 4, comment: "Nice views"),
        Reviews(author: "Sara", rating: 5, comment: "Very clean path")
    ]
    var gallery: [Gallery] = [
        Gallery(image: UIImage(named: "UrgenchBotanicalGarden")!),
        Gallery(image: UIImage(named: "UrgenchBotanicalGarden")!),
        Gallery(image: UIImage(named: "UrgenchBotanicalGarden")!),
        Gallery(image: UIImage(named: "BukharaGreenPark")!)
    ]
    private var isAboutExpanded = false
    
    let hourView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let distanceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let rateView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let timeIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "clock")?.withRenderingMode(.alwaysTemplate)
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "10-12 hours"
        label.font = UIFont(name: "Cochin-Bold", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let durationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.text = "Duration"
        label.font = UIFont(name: "Cochin", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let distanceIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "point.bottomleft.forward.to.point.topright.scurvepath")?.withRenderingMode(.alwaysTemplate)
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    let distanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "20 km"
        label.font = UIFont(name: "Cochin-Bold", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let distanceLabel2: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Distance"
        label.font = UIFont(name: "Cochin", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let rateIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate)
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    let rateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "4.8k"
        label.font = UIFont(name: "Cochin-Bold", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let reviewsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Reviews"
        label.font = UIFont(name: "Cochin", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let detailsButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Details", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Cochin-Bold", size: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(detailsTapped), for: .touchUpInside)
        return button
    }()
    lazy var routeListButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Route List", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Cochin-Bold", size: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(routelistTapped), for: .touchUpInside)
        return button
    }()
    lazy var  reviewsButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Rewies", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Cochin-Bold", size: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(reviewsTapped), for: .touchUpInside)
        return button
    }()
    let aboutView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    lazy var aboutTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Cochin", size: 20)
        label.text = "About Tavarua"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var aboutLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Cochin", size: 15)
        label.numberOfLines = 9
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ultricies, metus eu sollicitudin condimentum, magna orci volutpat tellus, nec sagittis diam tortor nec mi. Mauris egestas fermentum tortor ac pulvinar. Pellentesque porttitor commodo nunc, nec volutpat augue efficitur vitae. Quisque ac velit ornare massa iaculis fermentum vitae at lectus. Morbi at lorem ante. Pellentesque ut nunc pharetra, fermentum lectus ac, malesuada sem. Morbi pulvinar vulputate quam, eget congue purus bibendum sed. \nSuspendisse in purus erat. Proin vel lobortis orci. Nam ultricies in justo nec ultricies. Mauris non ipsum ac nisl dignissim ultricies eget quis felis. Curabitur a pulvinar ante. Quisque et blandit massa. Quisque sodales, quam nec aliquet pretium, odio nunc dignissim ex, id maximus dui nunc eget nibh. Nunc fringilla iaculis vehicula. Sed eu elementum sapien. Morbi auctor, elit ut eleifend sodales, tellus mi consequat nulla, vel luctus erat lacus sit amet dui. Phasellus felis ipsum, gravida et ipsum nec, efficitur feugiat velit."
        label.isUserInteractionEnabled = true
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let scroll: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let routeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.register(RouteCell.self, forCellReuseIdentifier: RouteCell.identifier)
        return view
    }()
    let reviewsTableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        view.register(ReviewsTableViewCell.self, forCellReuseIdentifier: ReviewsTableViewCell.identifier)
        return view
    }()
    let galleryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Cochin-Bold", size: 30)
        label.text = "Gallery"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let viewAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("View All", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.systemGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(viewTapped), for: .touchUpInside)
        return button
    }()
    let galleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing  = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.register(GalleryCollectionCell.self, forCellWithReuseIdentifier: GalleryCollectionCell.identifier)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUPUI()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        reviewsTableView.dataSource = self
        reviewsTableView.delegate = self
        
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource  = self
        
        aboutView.isHidden = false
        tableView.isHidden = true
        reviewsTableView.isHidden = true
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        updateSelectButtons(detailsButton)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func detailsTapped(){
        updateSelectButtons(detailsButton)
        aboutView.isHidden = false
        tableView.isHidden = true
        reviewsTableView.isHidden = true
        
        print("details Tapped")
    }
    @objc func routelistTapped(){
        updateSelectButtons(routeListButton)
        aboutView.isHidden = true
        tableView.isHidden = false
        reviewsTableView.isHidden = true
        
        print("route Tapped")
    }
    @objc func reviewsTapped(){
        updateSelectButtons(reviewsButton)
        aboutView.isHidden = true
        tableView.isHidden = true
        reviewsTableView.isHidden = false
        
        print("reviews Tapped")
    }
    @objc func viewTapped(_ sender: UIButton){
        isAboutExpanded.toggle()
        
        if isAboutExpanded{
            aboutLabel.numberOfLines = 0
            viewAllButton.setTitle("View Less", for: .normal)
        }else{
            aboutLabel.numberOfLines = 9
            viewAllButton.setTitle("View All", for: .normal)
        }
        
        UIView.transition(with: aboutLabel, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseInOut], animations: {
            self.aboutLabel.layoutIfNeeded()
        })
        
        print("View tapped")
    }
    
    
    private func setUPUI(){
        addSubview(hourView)
        addSubview(distanceView)
        addSubview(rateView)
        hourView.addSubview(timeIcon)
        hourView.addSubview(timeLabel)
        hourView.addSubview(durationLabel)
        distanceView.addSubview(distanceIcon)
        distanceView.addSubview(distanceLabel)
        distanceView.addSubview(distanceLabel2)
        rateView.addSubview(rateIcon)
        rateView.addSubview(rateLabel)
        rateView.addSubview(reviewsLabel)
        addSubview(detailsButton)
        addSubview(routeListButton)
        addSubview(reviewsButton)
        addSubview(aboutView)
        aboutView.addSubview(aboutTitleLabel)
        aboutView.addSubview(scroll)
        scroll.addSubview(aboutLabel)
        addSubview(tableView)
        addSubview(reviewsTableView)
        addSubview(galleryLabel)
        addSubview(viewAllButton)
        addSubview(galleryCollectionView)
        
        hourView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        hourView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        hourView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        hourView.widthAnchor.constraint(equalToConstant: 114).isActive = true
        
        distanceView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        distanceView.leftAnchor.constraint(equalTo: hourView.rightAnchor, constant: 10).isActive = true
        distanceView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        distanceView.widthAnchor.constraint(equalToConstant: 114).isActive = true
        
        rateView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        rateView.leftAnchor.constraint(equalTo: distanceView.rightAnchor, constant: 10).isActive = true
        rateView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        rateView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        timeIcon.topAnchor.constraint(equalTo: hourView.topAnchor, constant: 5).isActive = true
        timeIcon.leftAnchor.constraint(equalTo: hourView.leftAnchor, constant: 5).isActive = true
        timeIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        timeIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        timeLabel.topAnchor.constraint(equalTo: hourView.topAnchor, constant: 5).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: timeIcon.rightAnchor, constant: 10).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: hourView.rightAnchor, constant: -5).isActive = true
        
        durationLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 5).isActive = true
        durationLabel.leftAnchor.constraint(equalTo: timeIcon.rightAnchor, constant: 10).isActive = true
        durationLabel.rightAnchor.constraint(equalTo: hourView.rightAnchor, constant: -5).isActive = true
        durationLabel.bottomAnchor.constraint(equalTo: hourView.bottomAnchor, constant: -5).isActive = true
        
        distanceIcon.topAnchor.constraint(equalTo: distanceView.topAnchor, constant: 5).isActive = true
        distanceIcon.leftAnchor.constraint(equalTo: distanceView.leftAnchor, constant: 5).isActive = true
        distanceIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        distanceIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        distanceLabel.topAnchor.constraint(equalTo: distanceView.topAnchor, constant: 5).isActive = true
        distanceLabel.leftAnchor.constraint(equalTo: distanceIcon.rightAnchor, constant: 10).isActive = true
        distanceLabel.rightAnchor.constraint(equalTo: distanceView.rightAnchor, constant: -5).isActive = true
        
        distanceLabel2.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: 5).isActive = true
        distanceLabel2.leftAnchor.constraint(equalTo: distanceIcon.rightAnchor, constant: 10).isActive = true
        distanceLabel2.rightAnchor.constraint(equalTo: distanceView.rightAnchor, constant: -5).isActive = true
        distanceLabel2.bottomAnchor.constraint(equalTo: distanceView.bottomAnchor, constant: -5).isActive = true
        
        rateIcon.topAnchor.constraint(equalTo: rateView.topAnchor, constant: 5).isActive = true
        rateIcon.leftAnchor.constraint(equalTo: rateView.leftAnchor, constant: 5).isActive = true
        rateIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        rateIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        rateLabel.topAnchor.constraint(equalTo: rateView.topAnchor, constant: 5).isActive = true
        rateLabel.leftAnchor.constraint(equalTo: rateIcon.rightAnchor, constant: 10).isActive = true
        rateLabel.rightAnchor.constraint(equalTo: rateView.rightAnchor, constant: -5).isActive = true
        
        reviewsLabel.topAnchor.constraint(equalTo: rateLabel.bottomAnchor, constant: 5).isActive = true
        reviewsLabel.leftAnchor.constraint(equalTo: rateIcon.rightAnchor, constant: 10).isActive = true
        reviewsLabel.rightAnchor.constraint(equalTo: rateView.rightAnchor, constant: -5).isActive = true
        reviewsLabel.bottomAnchor.constraint(equalTo: rateView.bottomAnchor, constant: -5).isActive = true
        
        detailsButton.topAnchor.constraint(equalTo: hourView.bottomAnchor, constant: 10).isActive = true
        detailsButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        detailsButton.widthAnchor.constraint(equalToConstant: 114).isActive = true
        detailsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        routeListButton.topAnchor.constraint(equalTo: distanceView.bottomAnchor, constant: 10).isActive = true
        routeListButton.leftAnchor.constraint(equalTo: detailsButton.rightAnchor, constant: 10).isActive = true
        routeListButton.widthAnchor.constraint(equalToConstant: 114).isActive = true
        routeListButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        reviewsButton.topAnchor.constraint(equalTo: rateView.bottomAnchor, constant: 10).isActive = true
        reviewsButton.leftAnchor.constraint(equalTo: routeListButton.rightAnchor, constant: 10).isActive = true
        reviewsButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        reviewsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        aboutView.topAnchor.constraint(equalTo: detailsButton.bottomAnchor, constant: 10).isActive = true
        aboutView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        aboutView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        aboutView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        aboutTitleLabel.topAnchor.constraint(equalTo: aboutView.topAnchor, constant: 10).isActive = true
        aboutTitleLabel.leftAnchor.constraint(equalTo: aboutView.leftAnchor, constant: 10).isActive = true
        aboutTitleLabel.rightAnchor.constraint(equalTo: aboutView.rightAnchor, constant: -10).isActive = true
        
        scroll.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 5).isActive = true
        scroll.leftAnchor.constraint(equalTo: aboutView.leftAnchor, constant: 5).isActive = true
        scroll.rightAnchor.constraint(equalTo: aboutView.rightAnchor, constant: -5).isActive = true
        scroll.bottomAnchor.constraint(equalTo: aboutView.bottomAnchor).isActive = true
        
        
        aboutLabel.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        aboutLabel.leftAnchor.constraint(equalTo: scroll.leftAnchor).isActive = true
        aboutLabel.rightAnchor.constraint(equalTo: scroll.rightAnchor).isActive = true
        aboutLabel.widthAnchor.constraint(equalTo: scroll.widthAnchor).isActive = true
        aboutLabel.bottomAnchor.constraint(equalTo: scroll.bottomAnchor).isActive = true
        
        tableView.topAnchor.constraint(equalTo: detailsButton.bottomAnchor, constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: galleryLabel.topAnchor, constant: -15).isActive = true
        
        reviewsTableView.topAnchor.constraint(equalTo: detailsButton.bottomAnchor, constant: 10).isActive = true
        reviewsTableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        reviewsTableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        reviewsTableView.bottomAnchor.constraint(equalTo: galleryLabel.topAnchor, constant: -15).isActive = true

            
        galleryLabel.topAnchor.constraint(equalTo: aboutView.bottomAnchor, constant: 10).isActive = true
        galleryLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        
        viewAllButton.centerYAnchor.constraint(equalTo: galleryLabel.centerYAnchor).isActive = true
        viewAllButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        viewAllButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        viewAllButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        galleryCollectionView.topAnchor.constraint(equalTo: galleryLabel.bottomAnchor, constant: 10).isActive = true
        galleryCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        galleryCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        galleryCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        galleryCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
    }
    private func updateSelectButtons(_ selectedButton: UIButton) {
        let buttons = [detailsButton, routeListButton, reviewsButton]
        
        for button in buttons {
            if button === selectedButton {
                button.backgroundColor = .white
                button.layer.cornerRadius = 25
                button.layer.borderColor = UIColor.black.cgColor
                button.setTitleColor(.black, for: .normal)
                button.layer.borderWidth = 1
            }
            else{
                button.backgroundColor = .lightGray
                button.layer.borderWidth = 0
                button.layer.borderColor = nil
                button.setTitleColor(.black, for: .normal)
            }
        }
    }
    
}
extension InfoView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
            return routes.count
        }
        else if tableView == self.reviewsTableView {
            return reviews.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: RouteCell.identifier, for: indexPath) as! RouteCell
            cell.configure(routes[indexPath.row])
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: ReviewsTableViewCell.identifier, for: indexPath) as! ReviewsTableViewCell
            cell.configure(reviews[indexPath.row])
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.tableView{
            return 80
        }
        else{
            return 150
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.tableView{
            print("Selected Route:", routes[indexPath.row].title)
        }
        else{
            print("Selected Reviews", reviews[indexPath.row].author)
        }
    }
}
extension InfoView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionCell.identifier, for: indexPath) as! GalleryCollectionCell
        cell.configure(gallery[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
}
