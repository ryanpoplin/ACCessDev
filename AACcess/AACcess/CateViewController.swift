//
//  CateViewController.swift
//  AACcess
//
//  Created by Byrdann Fox on 1/28/15.
//  Copyright (c) 2015 ExcepApps, Inc. All rights reserved.
//

import UIKit
import CoreData

// 1.) A RED CLOSE LABELS OBJECTS, REVIEW CODE, MAKE USEFUL COMMENTS, AND DO SOME FINAL FUNCTIONALITY AND UI TESTING FOR CURRENT CODE...
// 2.) ADD THE COREDATA STANDARD SHORTCUT FUNCTIONALITY WITH AN ACTION SHEET TO DETERMINE IT'S GOING TO BE ASSCIATED WITH THE SHORTCUTS TABLEVIEW DATASOURCE...
// 3.) JUST FIGURE THE CATEGORY SHORTCUTS SETUP WITH TABLE VIEW NAVIGATION AND COREDATA...
// 4.) TEST THE FUCK OUT OF EVERYTHING AND MAKE SURE ADAM IS HAPPY WITH IT...

class CateViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    override func viewDidAppear(animated:Bool) {
        
        super.viewDidAppear(animated)
        
    }
    
    var tableView: UITableView?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView?.dataSource = self
        tableView?.delegate = self
        
        tableView = UITableView(frame: view.bounds, style: .Plain)
        
        if let theTableView = tableView {
            theTableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier:"identifier")
            
            theTableView.dataSource = self
            theTableView.delegate = self
            
            theTableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
            
            view.addSubview(theTableView)
            
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 25
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "mycell")
        cell.textLabel?.text = "row#\(indexPath.row)"
        cell.detailTextLabel?.text = "subtitle#\(indexPath.row)"
        return cell
    }
    
}