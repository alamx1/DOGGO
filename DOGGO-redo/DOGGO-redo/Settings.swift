//
//  Settings.swift
//  DOGGO-redo
//
//  Created by Michelle Natasha on 11/6/19.
//  Copyright © 2019 Michelle Natasha. All rights reserved.
//

import UIKit

class Settings: UIViewController {

    @IBAction func LEDSwitch(_ sender: UISwitch) {
        if(sender.isOn)
        {
            //turn LED on
        }
        else
        {
            //turn LED off
        }
    }
    
    @IBAction func notifSwitch(_ sender: UISwitch) {
        if(sender.isOn)
        {
            //turn notif on
        }
        else
        {
            //turn notif off
        }
    }
    
    @IBOutlet weak var rangeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
