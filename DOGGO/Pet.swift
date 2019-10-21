//
//  Pet.swift
//  DOGGO
//
//  Created by michelle natasha on 10/19/19.
//  Copyright © 2019 DOGGO. All rights reserved.
//

import UIKit

class Pet {
    
    //MARK: Properties
    
    var petname: String
    var petphoto: UIImage?
    
    //MARK: Initialization
     
    init?(name: String, photo: UIImage?) {
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.petname = name
        self.petphoto = photo
        

    }
}
