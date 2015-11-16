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


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TableViewCellDelegate{

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
        self.tableCells.append(self.cellWithIdentifier(cellIdentifierOneTextField))
        self.tableCells.append(self.cellWithIdentifier(cellIdentifierLeftDetail))
        self.tableCells.append(self.cellWithIdentifier(cellIdentifierAddMore))
        
        
        NSLog("table cell \(self.tableCells)")
        
        tableContent.reloadData()

    }
    /**
     Các cell này khởi tạo và lưu hết vào mảng, việc add thêm các cell sẽ quản lý trong 1 mảng, truy suất trực tiếp, không cần cơ chế reusable của table view ios
     
     - parameter identifier:
     
     - returns:
     */
    func cellWithIdentifier(identifier: NSString!) -> UITableViewCell{
        
        switch identifier {
            case cellIdentifierWithLabel:
                let cell = TableViewCellLabel.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifierWithLabel)
                cell.delegate = self
                return cell
            case cellIdentifierOneTextField:
                let cell = TextFieldTableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifierOneTextField)
                cell.delegate = self
                return cell
            case cellIdentifierName:
                let cell = self.tableContent.dequeueReusableCellWithIdentifier(cellIdentifierName, forIndexPath: NSIndexPath.init(forRow: 2, inSection: 0))
//                cell.delegate = self
                return cell
            case cellIdentifierCustomTextFields:
                let cell = self.tableContent.dequeueReusableCellWithIdentifier(cellIdentifierCustomTextFields, forIndexPath: NSIndexPath.init(forRow: 3, inSection: 0))
//                cell.delegate = self
                return cell
            case cellIdentifierLeftDetail:
                let cell = LeftDetailTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifierLeftDetail)
                cell.delegate = self
                return cell
            case cellIdentifierAddMore:
                let cell = AddMoreTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifierAddMore)
                cell.delegate = self
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
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        }
    }
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: { (action , indexPath) -> Void in
            
            // Your delete code here.....
        })
        
        // You can set its properties like normal button
        deleteAction.backgroundColor = UIColor.redColor()
        
        return [deleteAction]
    }
    
    //MARK: Base table view cell delegate 
    
    func tableViewCell(cell: BaseTableViewCell, buttonTap: UIButton) {
//        self.tableView(self.tableContent, commitEditingStyle: .Delete, forRowAtIndexPath: NSIndexPath(forRow: 1, inSection: 0))
    }
    
 
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
//    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }

}

