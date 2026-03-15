//
//  MapVC.swift
//  sukunat
//
//  Created by Xan Xanzaki on 20/11/25.
//

import UIKit
import MapLibre
import CoreLocation

class MapVC: UIViewController {
    
    var mapView: MLNMapView!
    let locationManager = CLLocationManager()
    
    private let zoomInButton = UIButton()
    private let zoomOutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUPUI()
        setUPZoomButtons()
        checkLocationPermission()
        
        addAllPlaces()
        
        setUPLongPress()
    }
    private func checkLocationPermission() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    private func setUPUI(){
        let styleURL = URL(string: "https://tiles.openfreemap.org/styles/liberty")
        
        mapView = MLNMapView(frame: view.bounds, styleURL: styleURL)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.automaticallyAdjustsContentInset = true
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        mapView.setCenter(CLLocationCoordinate2D(latitude: 41.3111, longitude: 69.2406), zoomLevel: 12, animated: true)
        
        
        view.addSubview(mapView)
        
        view.sendSubviewToBack(mapView)
        
    }
    private func setUPZoomButtons(){
        configureButton(zoomInButton, title: "+", yOffSet: -270)
        configureButton(zoomOutButton, title: "-", yOffSet: -200)
        
        zoomInButton.addTarget(self, action: #selector(zoomIn), for: .touchUpInside)
        zoomOutButton.addTarget(self, action: #selector(zoomOut), for: .touchUpInside)
    }
    private func configureButton(_ button: UIButton, title: String, yOffSet: CGFloat){
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 0.3
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 50),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: yOffSet)
        ])
    }
    @objc func zoomIn(){
        mapView.setZoomLevel(mapView.zoomLevel + 1, animated: true)
    }
    @objc func zoomOut(){
        mapView.setZoomLevel(mapView.zoomLevel - 1, animated: true)
    }
    private func addAllPlaces(){
        for place in placesCoordinates{
            let annotation = MLNPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
            annotation.title = place.placeName
            mapView.addAnnotation(annotation)
        }
    }
    private func setUPLongPress(){
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        mapView.addGestureRecognizer(longPress)
    }
    @objc func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let point = gesture.location(in: mapView)
            let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
            
            // Yangi marker yaratish
            let newAnnotation = MLNPointAnnotation()
            newAnnotation.coordinate = coordinate
            newAnnotation.title = "Yangi sukunat maskani"
            
            mapView.addAnnotation(newAnnotation)
            
            // Konsolga tekshirish uchun chiqarish
            print("Yangi joy: \(coordinate.latitude), \(coordinate.longitude)")
        }
    }
    private func openDetails(for placeName: String) {
        let detailsVC = PlacesdDetailsVC()
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
extension MapVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            mapView.userTrackingMode = .follow
        }
    }
}
extension MapVC: MLNMapViewDelegate {
    func mapView(_ mapView: MLNMapView, didFinishLoading style: MLNStyle) {
        if let userLocation = mapView.userLocation?.coordinate {
            mapView.setCenter(userLocation, zoomLevel: 15, animated: true)
        }
    }
    func mapView(_ mapView: MLNMapView, annotationCanShowCallout annotation: MLNAnnotation) -> Bool {
        return true
    }

    func mapView(_ mapView: MLNMapView, tapOnCalloutFor annotation: MLNAnnotation) {
        openDetails(for: (annotation.title ?? "")!)
    }
}

