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

// 1.) Figure out the fucking interface for saving shortcuts and categories an saving shit to particular cates...
// 2.) ADD THE COREDATA STANDARD SHORTCUT FUNCTIONALITY WITH AN ACTION SHEET TO DETERMINE IT'S GOING TO BE ASSCIATED WITH THE SHORTCUTS TABLEVIEW DATASOURCE...
// 3.) JUST FIGURE THE CATEGORY SHORTCUTS SETUP WITH TABLE VIEW NAVIGATION AND COREDATA...MOST CHALLENGING FEATURE...
// 4.) TEST THE FUCK OUT OF EVERYTHING AND MAKE SURE ADAM IS HAPPY WITH IT...
// 5.) ASK POOLOS/FIGURE OUT ON YOUR OWN ABOUT ANY QUESTIONS I HAVE INCLUDING HOW TO: PREVENT TWO BARBUTTONITEMS FROM BEING PRESSED AT THE SAME TIME, AND HOW TO KEEP THE KEYBOARD OBJECT OPEN EVEN IF YOU TRY TO DISMISS IT...
// 6.) SETUP JAVASCRIPTCORE TEXT ANALYZER CODE AND GET THE RETURN VALUES GOING(ALREADY DONE JUST COPY AND PASTE FROM SWIFTCOREDATA PROJECT)...
// 7.) MEET WITH TERRY (TANGIBLY) AND GET THIS KEEN.IO BULLSHIT IN CHECK AND CONFIGURE HOW TO GET UPDATES ON WHEN I NEED TO UPDATE THIS AND THAT WITH THEM FOR CUSTOMER SATIFACTION, ETC...CONNECT THE APP WITH KEEN.IO SDK AND CONFIGURE ALL POSSIBLE INDUSTRY QUERIES WE CAN PULL OFF NOW...
// 8.) MAKE A BALLER BACKBONE.JS APP WITH EVERYTHING WE CAN DO NOW DATA WISE AND GET THAT SHIT IN THE APP NICE AND NAVIGABLE AND SHOW THEM GRAPHS (ADD A WEBVIEW TO THE IOS APP?)...ALSO ASK ABOUT AFFORDABILITY OPTIONS WITH KEEN WITH A COREDATA STORAGE/TIMED RELEASE LAYER...
// 9.) ADD PARSE.COM TO THE MIX FOR BASIC LOGIN/LOGOUT(IOS APP TO KEEN.IO AND WEB APP ASSOCIATIONS)...ADD MOON CLERK || STRIPE...ADD A CORE DATA SAVED PRIVACY POLICTY AGREEMENT LAYER FOR LEGAL SHIT AND GET ADAMS PRIVACY POLICY AGREEMENT SHIT...
// 10.) TESTFLIGHT THE FUCK OUT OF THIS AND GET SOME SERIOUS TRACTION GOING...
// 11.) GET APP DESCRIPTION READY AND ALL THAT GOOD SHIT AND SEND TO APPLE FOR APPROVAL...

// *.) WISH LIST ITEMS: USEFUL USER SETTINGS VIEW, CUSTOM KEYBOARD OBJECT, etc...

// ...
class ViewController: UIViewController, UITextViewDelegate, AVSpeechSynthesizerDelegate, UIPopoverControllerDelegate {
    
    // hide the status bar...
    override func prefersStatusBarHidden() -> Bool {
     
        return true
    
    }
    
    // get reference access to the application's delegate...
    let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    
    // reference the storyboard UI objects...
    @IBOutlet weak var textArea: UITextView!
    @IBOutlet weak var clearTextViewButton: UIButton!
    @IBOutlet weak var speakOrPauseButton: UIButton!
    @IBOutlet weak var saveShortcutButton: UIButton!
    @IBOutlet weak var shortcutsButton: UIButton!
    @IBOutlet weak var catesButton: UIButton!
    
    // internal class variables...
    internal var textViewness: String = ""
    internal var speechPaused: Bool = false
    internal var synthesizer: AVSpeechSynthesizer!
    
    // assign the PopView.xib file as the interface/view for the PopViewController class...
    
    internal let popView = PopViewController(nibName: "PopView", bundle: nil)
    
    internal let cateView = CateViewController(nibName: "CateView", bundle: nil)
    
    override func viewWillAppear(animated: Bool) {

        super.viewDidAppear(animated)

        catesButton.exclusiveTouch = true
        catesButton.setTitle("Categories", forState: .Normal)
        shortcutsButton.exclusiveTouch = true
        shortcutsButton.setTitle("Shortcuts", forState: .Normal)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // prevent the app from sleeping...
        UIApplication.sharedApplication().idleTimerDisabled = true
        
        // ...
        textArea.delegate = self
        
        // AVFoundation...
        self.synthesizer = AVSpeechSynthesizer()
        self.synthesizer.delegate = self
        speechPaused = false
        
        // fix the cursor issue...
        self.automaticallyAdjustsScrollViewInsets = false
        
        // focus on the textView object...
        textArea?.becomeFirstResponder()
        
        clearTextViewButton.exclusiveTouch = true
        speakOrPauseButton.exclusiveTouch = true
        saveShortcutButton.exclusiveTouch = true
        
        // make those buttons look good...
        clearTextViewButton.layer.cornerRadius = 5
        speakOrPauseButton.layer.cornerRadius = 5
        saveShortcutButton.layer.cornerRadius = 5
        
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
        
        popView.dismissViewControllerAnimated(true, completion: nil)
        cateView.dismissViewControllerAnimated(true, completion: nil)
        
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
    
    @IBAction func shortcutsButton(sender: UIButton) {
        
        cateView.dismissViewControllerAnimated(true, completion: nil)
        
        let popController = UIPopoverController(contentViewController: popView)
        
        popController.delegate = self
        
        popController.popoverContentSize = CGSize(width: 1000, height: 231)
        
        popController.presentPopoverFromRect(sender.frame, inView: self.view, permittedArrowDirections: .Up, animated: true)
        
    }
    
    @IBAction func saveButtonPressed(sender: UIButton!) {
        
        println("...")
        
        /*var controller: UIAlertController?
        
        controller = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
            
        let action = UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: {(paramAction:UIAlertAction!) in println("The done button was pressed...")})
            
        controller!.addAction(action)
        
        self.presentViewController(controller!, animated: true, completion: nil)*/
    
    }
    
    // action method for the clear button object...
    @IBAction func clearTextViewContent(sender: UIButton) {
    
        textArea?.text = nil
        
        self.synthesizer.stopSpeakingAtBoundary(.Immediate)
        
        speakOrPauseButton.enabled = false
        saveShortcutButton.enabled = false
    
    }
    
    @IBAction func catesAction(sender: UIButton) {
    
        popView.dismissViewControllerAnimated(true, completion: nil)
        
        let popController = UIPopoverController(contentViewController: cateView)
        
        popController.delegate = self
        
        popController.popoverContentSize = CGSize(width: 1000, height: 231)
        
        popController.presentPopoverFromRect(sender.frame, inView: self.view, permittedArrowDirections: .Up, animated: true)
    
    }
    
    @IBAction func speakOrPausePressed(sender: UIButton) {
    
        var textString:NSString = textArea.text
        var charSet:NSCharacterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        var trimmedString:NSString = textString.stringByTrimmingCharactersInSet(charSet)
        
        if trimmedString.length == 0 {
            
        } else {
            
            if speechPaused == false {
                
                speakOrPauseButton.setTitle("Pause", forState: .Normal)
                self.synthesizer.continueSpeaking()
                speechPaused = true
                
            } else {
                
                speakOrPauseButton.setTitle("Speak", forState: .Normal)
                speechPaused = false
                self.synthesizer.pauseSpeakingAtBoundary(.Immediate)
                
            }
            
            if self.synthesizer.speaking == false {
                
                var text:String = textArea!.text
                var utterance:AVSpeechUtterance = AVSpeechUtterance(string:text)
                utterance.rate = 0.02
                self.synthesizer.speakUtterance(utterance)
                
            }
            
        }
    
    }
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer!, didFinishSpeechUtterance utterance: AVSpeechUtterance!) {
        
        speakOrPauseButton.setTitle("Speak", forState: .Normal)
        speechPaused = false
        var sentenceText: String = textArea.text
        
        // analyzeText(sentenceText)
        
    }
    
    // prepare for a segue...
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        popView.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    // ...
    @IBAction func dataAction(sender: UIBarButtonItem) {}
    
}