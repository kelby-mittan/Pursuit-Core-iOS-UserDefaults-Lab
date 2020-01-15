//
//  ViewController.swift
//  UserDefaultsHoroscope
//
//  Created by Kelby Mittan on 1/14/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class SignPickerController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var signLabel: UILabel!
    @IBOutlet var signPicker: UIPickerView!
    
    private let signs = ["Aires", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

