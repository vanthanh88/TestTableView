//
//  DataBaseManager.swift
//  DataModel
//
//  Created by DataModel on 11/9/15.
//  Copyright © 2015 DataModel. All rights reserved.
//

import UIKit
import CoreData

class DataBaseManager: NSObject {
    
    var coreDataContext: NSManagedObjectContext
    
    init(managedObjectContext context: NSManagedObjectContext) {
        self.coreDataContext = context
    }
    
    func saveData() throws -> Bool {
        if ((self.coreDataContext.hasChanges) == true) {
            do {
                try self.coreDataContext.save()
            }catch {
                self.coreDataContext.rollback()
                return false
            }
        }
        return true
    }

}
