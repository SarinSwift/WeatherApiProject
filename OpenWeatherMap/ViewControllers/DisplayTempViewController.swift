//
//  DisplayTempViewController.swift
//  OpenWeatherMap
//
//  Created by Sarin Swift on 8/2/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class DisplayTempViewController: UIViewController {

    @IBOutlet weak var maximumTempLabel: UILabel!
    @IBOutlet weak var minimumTempLabel: UILabel!
    @IBOutlet weak var moodInputTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveBtnTapped(_ sender: UIButton) {
    }
}
