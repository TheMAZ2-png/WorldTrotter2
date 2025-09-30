//
//  MapViewController.swift
//  WorldTrotter2
//
//  Created by Chris Mazurek on 9/30/25.
//


import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!
    let poiLabel = UILabel()
    let poiSwitch = UISwitch()
    let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
    
    override func loadView() {
        mapView = MKMapView()

        view = mapView

        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)

        poiLabel.text = "Points of Interest"
        poiLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(poiLabel)

        poiSwitch.translatesAutoresizingMaskIntoConstraints = false
        poiSwitch.isOn = false
        poiSwitch.addTarget(self, action: #selector(poiSelect(_:)), for: .valueChanged)
        
        view.addSubview(poiSwitch)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            segmentedControl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            poiLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
            poiLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            poiSwitch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
            poiSwitch.leadingAnchor.constraint(equalTo: poiLabel.trailingAnchor, constant: 4),
            poiSwitch.centerYAnchor.constraint(equalTo: poiLabel.centerYAnchor),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func poiSelect(_ switchVal: UISwitch) {
        if (switchVal.isOn) {
            mapView.pointOfInterestFilter = MKPointOfInterestFilter.includingAll
        } else {
            mapView.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
        }
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
            poiLabel.textColor = UIColor.black
        case 1:
            mapView.mapType = .hybrid
            poiLabel.textColor = UIColor.white
        case 2:
            mapView.mapType = .satellite
            poiLabel.textColor = UIColor.white
        default:
            break;
        }
    }
}
