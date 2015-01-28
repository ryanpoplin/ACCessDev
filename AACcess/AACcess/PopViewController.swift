//
//  PopViewController.swift
//  AACcess
//
//  Created by Byrdann Fox on 1/26/15.
//  Copyright (c) 2015 ExcepApps, Inc. All rights reserved.
//

import UIKit
import CoreData

class PopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    var tableView: UITableView?
    
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