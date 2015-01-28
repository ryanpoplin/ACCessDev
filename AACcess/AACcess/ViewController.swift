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

// ...
class ViewController: UIViewController, UITextViewDelegate, AVSpeechSynthesizerDelegate {
    
    // hide the status bar...
    override func prefersStatusBarHidden() -> Bool {
     
        return true
    
    }
    
    // get reference access to the application's delegate...
    let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    
    // reference the storyboard UI objects...
    @IBOutlet weak var textArea: UITextView!
    @IBOutlet weak var dataButton: UIBarButtonItem!
    @IBOutlet weak var shortcutButton: UIBarButtonItem!
    @IBOutlet weak var clearTextViewButton: UIButton!
    @IBOutlet weak var speakOrPauseButton: UIButton!
    @IBOutlet weak var saveShortcutButton: UIButton!
    
    
    // internal class variables...
    internal var textViewness: String = ""
    internal var speechPaused: Bool = false
    
    // ...
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // prevent the app from sleeping...
        UIApplication.sharedApplication().idleTimerDisabled = true
        
        // ...
        textArea.delegate = self
        
        // fix the cursor issue...
        self.automaticallyAdjustsScrollViewInsets = false
        
        // focus on the textView object...
        textArea?.becomeFirstResponder()
        
        if textArea.text == "" {
            
            // leave the clear button alone...
            speakOrPauseButton.enabled = false
            saveShortcutButton.enabled = false
            
        }
        
    }

    // ...
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    
    }
    
    func textViewDidChange(textView: UITextView) {
        
        // ...
        var textString: NSString = textView.text
        // ...
        var charSet: NSCharacterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        // ...
        var trimmedString: NSString = textString.stringByTrimmingCharactersInSet(charSet)
        
        if trimmedString.length == 0 {
            
            speakOrPauseButton.enabled = false
            saveShortcutButton.enabled = false
            
        } else {
            
            speakOrPauseButton.enabled = true
            saveShortcutButton.enabled = true
            
        }
        
    }

    // assign the PopView.xib file as the interface/view for the PopViewController class...
    internal let popView = PopViewController(nibName: "PopView", bundle: nil)
    
    // ...
    @IBAction func showPopView(sender: UIBarButtonItem) {
        
        let popController = UIPopoverController(contentViewController: popView)
        
        popController.popoverContentSize = CGSize(width: 450, height: 320)
        
        popController.presentPopoverFromBarButtonItem(shortcutButton, permittedArrowDirections: UIPopoverArrowDirection.Up, animated: true)
        
    }
    
    // action method for the clear button object...
    @IBAction func clearTextViewContent(sender: UIButton) {
    
        textArea?.text = nil
        
        speakOrPauseButton.enabled = false
        saveShortcutButton.enabled = false
    
    }
    
    // prepare for a segue...
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        popView.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    // ...
    @IBAction func dataAction(sender: UIBarButtonItem) {}
    
}