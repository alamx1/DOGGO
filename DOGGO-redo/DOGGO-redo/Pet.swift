//
//  Pet.swift
//  DOGGO-redo
//
//  Created by Michelle Natasha on 11/6/19.
//  Copyright © 2019 Michelle Natasha. All rights reserved.
//

import Foundation
import UIKit

class Pet {
    
    //MARK: Properties
    
    var petname: String = ""
    var petphoto: UIImage?
    var petstatus: Int = 0
    
    //MARK: Initialization
     
    init?(name: String, photo: UIImage?, status: Int) {
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (status >= 0) && (status <= 1) else {
            return nil
        }
        
        // Initialize stored properties.
        self.petname = name
        self.petphoto = photo
        self.petstatus = status
    }
}
