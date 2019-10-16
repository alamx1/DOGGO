//
//  TrackPet.swift
//  DOGGO
//
//  Created by michelle natasha on 10/6/19.
//  Copyright © 2019 DOGGO. All rights reserved.
//

import UIKit

class TrackPet: UIViewController {
    @IBOutlet weak var petname1: UILabel!
    
    let def = UserDefaults.standard
//    var name1 = Register.GlobalVar.petName1
    
    func display(){
        let name1 = def.value(forKey: Register.GlobalVar.petName1) as? String ?? ""
        petname1.text! = "Welcome "
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        display()
        // Do any additional setup after loading the view.
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
