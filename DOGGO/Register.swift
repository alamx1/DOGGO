//
//  Register.swift
//  DOGGO
//
//  Created by michelle natasha on 10/5/19.
//  Copyright © 2019 DOGGO. All rights reserved.
//

import UIKit

class Register: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var petnameField: UITextField!
    @IBOutlet weak var petbreedField: UITextField!
    @IBOutlet weak var petageField: UITextField!
    
    var petName1 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        usernameField.delegate = self
//        addressField.delegate = self
//        phoneField.delegate = self
//        petnameField.delegate = self
//        petbreedField.delegate = self
//        petageField.delegate = self
        // Do any additional setup after loading the view.
    }
//    @IBAction func RegisterButton(_ sender: Any) {
//        self.petName1 = petnameField.text!
//        performSegue(withIdentifier: "regDone", sender: self)
//        //display if successfully registered
//    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameField.resignFirstResponder()
        addressField.resignFirstResponder()
        phoneField.resignFirstResponder()
        petnameField.resignFirstResponder()
        petbreedField.resignFirstResponder()
        petageField.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc1 = segue.destination as! TrackPet
        vc1.name1 = self.petName1
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewController : UITextFieldDelegate{

}
