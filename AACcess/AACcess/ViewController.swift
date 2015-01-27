//
//  ViewController.swift
//  AACcess
//
//  Created by Byrdann Fox on 1/26/15.
//  Copyright (c) 2015 ExcepApps, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBOutlet weak var shortcutButton: UIBarButtonItem!
    
    @IBAction func showPopView(sender: UIBarButtonItem) {
        
        let popView = PopViewController(nibName: "PopView", bundle: nil)
        
        let popController = UIPopoverController(contentViewController: popView)
        
        popController.popoverContentSize = CGSize(width: 550, height: 500)
        
        popController.presentPopoverFromBarButtonItem(shortcutButton, permittedArrowDirections: UIPopoverArrowDirection.Down, animated: true)
        
    }
}