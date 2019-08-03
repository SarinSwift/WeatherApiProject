//
//  DisplayTempViewController.swift
//  OpenWeatherMap
//
//  Created by Sarin Swift on 8/2/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class DisplayTempViewController: UIViewController {
    
    var maxTempText: String!
    var minTempText: String!

    @IBOutlet weak var maximumTempLabel: UILabel!
    @IBOutlet weak var minimumTempLabel: UILabel!
    @IBOutlet weak var moodInputTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        maximumTempLabel.text = maxTempText
        minimumTempLabel.text = minTempText
    }

    @IBAction func saveBtnTapped(_ sender: UIButton) {
        // Save the user's mood before dismissing view controller
        self.dismiss(animated: true, completion: nil)
    }
}
