//
//  BaseTableViewCell.swift
//  TestTwo
//
//  Created by Nguyen Van Thanh on 10/24/15.
//  Copyright © 2015 Nguyen Van Thanh. All rights reserved.
//

import UIKit

public let addButtonTag = 112
public let deleteButtonTag = 113
public let titleButtonTag = 114


class BaseTableViewCell: UITableViewCell {

    
    @IBOutlet weak private var deleteButton: UIButton!
    @IBOutlet weak private var titleButton: UIButton!
    var delegate: TableViewCellDelegate?
    
    
    func configTag(){
        self.deleteButton.tag = deleteButtonTag
        self.titleButton.tag =  titleButtonTag
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonCellTapped(sender: AnyObject){
        
        NSLog("Celltapp \(sender)")
        self.delegate?.tableViewCell(self, buttonTap: sender as! UIButton)
    }

}


protocol TableViewCellDelegate {
    func tableViewCell(cell: BaseTableViewCell, buttonTap: UIButton)
    
}