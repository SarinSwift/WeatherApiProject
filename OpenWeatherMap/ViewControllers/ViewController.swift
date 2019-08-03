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
        guard let name = cityNameLabel.text else {
            print("City name incorrect")
            return
        }
        ServiceLayer.requestWeather(city: name, router: Router.getCityWeather(cityName: name)) { (result: Result<City, Error>) in
            switch result {
            case .failure:
                print("ERORR: \(result)")
            case .success(let object):
                print("SUCCESS: \(result)")
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let displayVC = sb.instantiateViewController(withIdentifier: "displayTempId") as! DisplayTempViewController
                displayVC.maxTempText = String(object.main.tempMax)
                displayVC.minTempText = String(object.main.tempMin)
                self.present(displayVC, animated: true, completion: nil)
            }
        }
        
    }
    
}

