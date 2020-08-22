//
//  RegistratoinViewController.swift
//  Registration of requests
//
//  Created by Master on 21.08.2020.
//  Copyright © 2020 Master. All rights reserved.
//

import UIKit

class RegistratoinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Страшные вещи, не судите строго это из-за нехватки времени
 
    @IBOutlet var FIOtextField: UITextField!
   
    @IBOutlet var PhoneTextField: [UITextField]!
    @IBOutlet var mailTextField: [UITextField]!
    
    @IBOutlet var LoginTextField: [UITextField]!
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var postAdressTextField: [UITextField]!
    @IBOutlet var zipCodeTextField: [UITextField]!
    @IBOutlet var CityTextField: UITextField!
    
    @IBOutlet var districtTextField: UITextField!
    
    @IBOutlet var streetTextField: UITextField!
    
    @IBOutlet var houseDistrict: UITextField!
    @IBOutlet var apartmentTextField: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
