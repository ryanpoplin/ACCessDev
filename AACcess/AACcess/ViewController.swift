//
//  ViewController.swift
//  AACcess
//
//  Created by Byrdann Fox on 1/26/15.
//  Copyright (c) 2015 ExcepApps, Inc. All rights reserved.
//

import UIKit
import AVFoundation
import QuartzCore
import JavaScriptCore

class ViewController: UIViewController, UITextViewDelegate, AVSpeechSynthesizerDelegate {
    
    @IBOutlet weak var dataButton: UIBarButtonItem!
    @IBOutlet weak var shortcutButton: UIBarButtonItem!
    @IBOutlet weak var textArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textArea?.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    internal let popView = PopViewController(nibName: "PopView", bundle: nil)
    
    @IBAction func showPopView(sender: UIBarButtonItem) {
        
        let popController = UIPopoverController(contentViewController: popView)
        
        popController.popoverContentSize = CGSize(width: 450, height: 320)
        
        popController.presentPopoverFromBarButtonItem(shortcutButton, permittedArrowDirections: UIPopoverArrowDirection.Up, animated: true)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        popView.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    // ...
    @IBAction func dataAction(sender: UIBarButtonItem) {}
    
}