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
    
    var signName: String?
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signPicker.dataSource = self
        signPicker.delegate = self
        textField.delegate = self
    }
    
    
}

extension SignPickerController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return signs.count
    }
}

extension SignPickerController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return signs[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        signName = signs[row].lowercased()
//        signLabel.text = signs[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: signs[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
    }
    
}

extension SignPickerController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        userName = textField.text
        nameLabel.text = userName
        textField.text = ""
        return true
    }
}

