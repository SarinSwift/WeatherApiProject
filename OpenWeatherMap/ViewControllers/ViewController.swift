//
//  ViewController.swift
//  OpenWeatherMap
//
//  Created by Sarin Swift on 8/2/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    private let locationManager = LocationManager()
    var currCity: String!

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var checkWeatherBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCurrLocation()
    }
    
    func getCurrLocation() {
        guard let exposedLocation = self.locationManager.exposedLocation else {
            print("exposed location is nil")
            return
        }
        self.locationManager.getPlace(for: exposedLocation) { (placemark) in
            guard let placemark = placemark else {
                return
            }
            
            if let city = placemark.locality {
                self.currCity = String(city)
                self.cityNameLabel.text = self.currCity
            }
        }
    }

    @IBAction func checkWeatherBtnTapped(_ sender: UIButton) {
        
    }
    
}

