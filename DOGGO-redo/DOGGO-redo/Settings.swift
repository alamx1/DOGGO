//
//  Settings.swift
//  DOGGO-redo
//
//  Created by Michelle Natasha on 11/6/19.
//  Copyright © 2019 Michelle Natasha. All rights reserved.
//

import UIKit

class Settings: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let array = ["Immediate", "Intermediate", "Far"]
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
    
    @IBOutlet weak var rangeButton: UIButton!
    @IBOutlet weak var rangeTable: UITableView!
    
    @IBAction func rangeButtonPressed(_ sender: UIButton) {
        self.rangeTable.isHidden = !self.rangeTable.isHidden
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        cell1.textLabel?.text = array[indexPath.row]
        return cell1
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell1 = tableView.cellForRow(at: indexPath)
        rangeButton.setTitle(cell1?.textLabel?.text, for: .normal)
        self.rangeTable.isHidden = true
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
