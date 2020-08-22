//
//  HelpForPasswwordViewController.swift
//  Registration of requests
//
//  Created by Master on 21.08.2020.
//  Copyright © 2020 Master. All rights reserved.
//

import UIKit

class HelpForPasswwordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        adviceTextview.text="Типичными требованиями для паролей являются наличие заглавных букв, цифр, символа подчёркивания и количество символов не менее восьми.Старайтесь не использовать простые пароли по типу qwerty123.Придумайте разные пароли для своих аккаунтов – особенно для тех, которые крайне важно защитить (например, для электронной почты и интернет-банкинга).Использовать один и тот же пароль для важных аккаунтов рискованно. Узнав пароль от одного из них, злоумышленник сможет войти в другие и получить доступ к вашей электронной почте и даже деньгам, а также узнать ваш адрес.Если вам сложно запомнить много разных комбинаций, воспользуйтесь диспетчером паролей. Ознакомьтесь с отзывами о подобных программах, обратите внимание на репутацию разработчика и выберите инструмент, который вам подходит."
    }
    
   
    @IBAction func backToRegistrationButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

   @IBOutlet weak var adviceTextview: UITextView!
    var adviceText:String!
   
    /*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
