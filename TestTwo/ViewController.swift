//
//  ViewController.swift
//  TestTwo
//
//  Created by Nguyen Van Thanh on 10/22/15.
//  Copyright © 2015 Nguyen Van Thanh. All rights reserved.
//

import UIKit

private let cellIdentifierName = "reuseIdentifierName"
private let cellIdentifierCustomTextFields = "cellIdentifierCustomTextFields"
private let cellIdentifierOneTextField = "cellIdentifierOneTextField"
private let cellIdentifierLeftDetail = "cellIdentifierLeftDetail"
private let cellIdentifierAddMore = "cellIdentifierAddMore"
private let cellIdentifierWithLabel = "cellIdentifierWithLabel"


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var tableContent: UITableView!
    
    private var tableCells: Array<UITableViewCell> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.translucent = false
        
 
        self.tableContent = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        self.tableContent.dataSource = self
        self.tableContent.delegate = self


        
        self.view.addSubview(self.tableContent)
       
        
        self.tableCells.append(self.cellWithIdentifier(cellIdentifierWithLabel))
        self.tableCells.append(self.cellWithIdentifier(cellIdentifierAddMore))
        self.tableCells.append(self.cellWithIdentifier(cellIdentifierOneTextField))
        self.tableCells.append(self.cellWithIdentifier(cellIdentifierLeftDetail))

        
        
        NSLog("table cell \(self.tableCells)")
        
        tableContent.reloadData()

    }
    
    func cellWithIdentifier(identifier: NSString!) -> UITableViewCell{
        
        switch identifier {
            case cellIdentifierWithLabel:
                let cell = TableViewCellLabel.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifierWithLabel)
                return cell
            case cellIdentifierOneTextField:
                let cell = TextFieldTableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifierOneTextField)
                return cell
            case cellIdentifierName:
                let cell = self.tableContent.dequeueReusableCellWithIdentifier(cellIdentifierName, forIndexPath: NSIndexPath.init(forRow: 2, inSection: 0))
                return cell
            case cellIdentifierCustomTextFields:
                let cell = self.tableContent.dequeueReusableCellWithIdentifier(cellIdentifierCustomTextFields, forIndexPath: NSIndexPath.init(forRow: 3, inSection: 0))
                return cell
            case cellIdentifierLeftDetail:
                let cell = LeftDetailTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifierLeftDetail)
                return cell
            case cellIdentifierAddMore:
                let cell = AddMoreTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifierAddMore)
                return cell
            default: return UITableViewCell()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCells.count
    }
 
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return tableCells[indexPath.row]
        
    }
    
 
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
//    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }

}

