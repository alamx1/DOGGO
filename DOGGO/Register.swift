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
    
    @IBOutlet weak var label1: UILabel!
    
    let defaults = UserDefaults.standard
    
    struct GlobalVar{
        static var petName1 = ""
    }
    
    struct KeyStruct{
        static let petName = "petName"
    }
    
    func checkForPetName(){
        let name = defaults.value(forKey: KeyStruct.petName) as? String ?? ""
        petnameField.text = name
        GlobalVar.petName1 = name
    }
    
    func initiateGlobalVar(){
        GlobalVar.petName1 = ""
    }
    
    func savePetName(){
        defaults.set(petnameField.text!, forKey:KeyStruct.petName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        initiateGlobalVar()
        checkForPetName()
//        GlobalVar.self.petName1 = petnameField.text!
//        addressField = self
//        phoneField = self
//        petnameField = self
//        petbreedField = self
//        petageField = self
        // Do any additional setup after loading the view.
    }
    @IBAction func RegisterButton(_ sender: Any) {
        savePetName() // fix this .....................
        label1.text! = "ERTY"
//        if(
//        self.petName1 = petnameField.text!
//        performSegue(withIdentifier: "regDone", sender: self)
        //display if successfully registered
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameField.resignFirstResponder()
        addressField.resignFirstResponder()
        phoneField.resignFirstResponder()
        petnameField.resignFirstResponder()
        petbreedField.resignFirstResponder()
        petageField.resignFirstResponder()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var vc1 = segue.destination as! TrackPet
//        vc1.name1 = self.petName1
//    }

}

extension ViewController : UITextFieldDelegate{

}
