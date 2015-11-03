//
//  LeftDetailTableViewCell.swift
//  TestTwo
//
//  Created by Nguyen Van Thanh on 10/24/15.
//  Copyright © 2015 Nguyen Van Thanh. All rights reserved.
//

import UIKit

class LeftDetailTableViewCell: BaseTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let nib = NSBundle.mainBundle().loadNibNamed("LeftDetailTableViewCell", owner: self, options: nil) as NSArray
        let cell = nib.objectAtIndex(0) as! UITableViewCell
        self.addSubview(cell)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
