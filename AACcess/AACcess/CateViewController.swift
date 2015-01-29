//
//  CateViewController.swift
//  AACcess
//
//  Created by Byrdann Fox on 1/28/15.
//  Copyright (c) 2015 ExcepApps, Inc. All rights reserved.
//

import UIKit
import CoreData

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