//
//  SaveAlertController.swift
//  AACcess
//
//  Created by Byrdann Fox on 1/29/15.
//  Copyright (c) 2015 ExcepApps, Inc. All rights reserved.
//

import UIKit

class SaveAlertController: UIViewController {
    
    var controller: UIAlertController?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        controller = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: {(paramAction:UIAlertAction!) in println("The done button was pressed...")})
        
        controller!.addAction(action)
        
    }
    
}