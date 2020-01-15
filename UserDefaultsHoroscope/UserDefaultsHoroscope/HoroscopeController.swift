//
//  HoroscopeController.swift
//  UserDefaultsHoroscope
//
//  Created by Kelby Mittan on 1/14/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class HoroscopeController: UIViewController {

    @IBOutlet var helloNameLabel: UILabel!
    
    @IBOutlet var horoscopeLabel: UILabel!
    
    var sign: String?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        
    }
    
    func updateUI() {
        guard let sign = sign, let name = name else {
            fatalError()
        }
        helloNameLabel.text = "Hi, \(name)"
        
        HoroscopeAPIClient.getHoroscope(for: sign) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("error \(appError)")
            case .success(let horoscope):
                DispatchQueue.main.async {
                    self?.horoscopeLabel.text = horoscope.horoscope
                }
            }
        }
    }
    

}
