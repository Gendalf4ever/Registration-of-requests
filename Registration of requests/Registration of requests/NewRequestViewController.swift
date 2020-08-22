//
//  NewRequestViewController.swift
//  Registration of requests
//
//  Created by Master on 21.08.2020.
//  Copyright © 2020 Master. All rights reserved.
//

import UIKit

class NewRequestViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
      var themesOfRequest=["Государство","Политика и Общество","Социальная сфера","ЖКХ","Благоустройство","Культура","Экономика","Безопасность","Транспорт и дорожное хозяйство","Инфраструктура","Сельское хозяйство"]
   
   
    @IBOutlet weak var selectedThemeLabel: UILabel!
    @IBOutlet weak var themePicker: UIPickerView!
   
    @IBAction func backButton(_ sender: Any) {
   dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        themePicker.dataSource=self
        themePicker.delegate=self
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      
          return 1
     }
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return themesOfRequest.count
     }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return themesOfRequest[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
     selectedThemeLabel.text = themesOfRequest[row]
     }

    @IBAction func backToProfile(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
//    override func prepareForSegue(segue:UIStoryboardSegue, sender: AnyObject?){
//
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationVC:ReqestViewController = segue.destination as! ReqestViewController
        destinationVC.textOflabel=selectedThemeLabel.text!
    
    }
}
