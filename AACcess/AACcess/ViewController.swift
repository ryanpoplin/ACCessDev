//
//  ViewController.swift
//  AACcess
//
//  Created by Byrdann Fox on 1/26/15.
//  Copyright (c) 2015 ExcepApps, Inc. All rights reserved.
//

// REVIEW THIS SHIT WITH ADAM...
// UPDATE DREW ON PROGRESS...

// FIGURE OUT HOW THE FUCK TO ADD EXCLUSIVE TOUCH TO BARBUTTONITEMS...
// TRY STACKOVERFLOW...
// TRY POOLOS...

// RIP OUT THE AAC APP...

// ADD TEXT TO SPEECH FEATURES: UITEXTVIEW, 3 UIBUTTONS: SPEAK, CLEAR, AND SAVE, AND LOCK THE KEYBOARD VIEW...
// ADD AVFOUNDATION, KEEN.IO, AND JAVASCRIPTCORE/JAVASCRIPT TEXT ANALYZER, AND COREDATA FOR SHORTCUTS...
// ADD THE TABLEVIEW TO THE POPOVER VIEW...

// ADD WEBVIEW, AND MAKE IT LINK THE THE EXCEPAPPSDATA SITE AND FIXED KEEN.IO SHIT, AND A NICE NAVABLE...
// BACKBONE.JS APP: UTLIZE THE TGGLYNLANDING PAGE MADE LAST MONTH...
// ADD PARSE FOR LOG IN/OUT AND CONFIGURE CONNECTIONS BETWEEEN THE PRIVACY AGREEMENT ON THE IOS APP...
// AND THE WEB APP...

// GET EVERTHING SMOOTH AND SIMPLE...
// MAKE SURE EVERYTHING WORKS WELL, AND IS SUPER USEFUL...

// SUBMIT TO STORE...

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dataButton: UIBarButtonItem!
    @IBOutlet weak var shortcutButton: UIBarButtonItem!
    
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

    internal let popView = PopViewController(nibName: "PopView", bundle: nil)
    
    @IBAction func showPopView(sender: UIBarButtonItem) {
        
        let popController = UIPopoverController(contentViewController: popView)
        
        popController.popoverContentSize = CGSize(width: 550, height: 500)
        
        popController.presentPopoverFromBarButtonItem(shortcutButton, permittedArrowDirections: UIPopoverArrowDirection.Down, animated: true)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        popView.dismissViewControllerAnimated(true, completion: nil)
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    // ...
    @IBAction func dataAction(sender: UIBarButtonItem) {}
    
}