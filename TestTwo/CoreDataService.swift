//
//  CoreDataService.swift
//  DataModel
//
//  Created by DataModel on 11/9/15.
//  Copyright © 2015 DataModel. All rights reserved.
//

import UIKit
import CoreData

class CoreDataService: NSObject {
    
    var managedObjectContext: NSManagedObjectContext?
    
    var managedObjectModel: NSManagedObjectModel?
    
    var persistentStoreCoordinator: NSPersistentStoreCoordinator?
    
    static let sharedInstance = CoreDataService()
    
    override init(){
        super.init()
    }
    
    
    func prepareCoreDataForUlaai() throws -> Bool {
        let result = true
        
        
        //do import data from json
        
        return result
    }
    
    
    //MARK: getter function
    func getManagedObjectModel() -> NSManagedObjectModel {
        if managedObjectModel == nil {
            let url = NSBundle.mainBundle().URLForResource("DataModel", withExtension: "momd")! as NSURL
            managedObjectModel = NSManagedObjectModel(contentsOfURL: url)
        }
        
        return managedObjectModel!
    }
    
    func getPersistentStoreCoordinator() -> NSPersistentStoreCoordinator {
        if persistentStoreCoordinator == nil {
            persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.getManagedObjectModel())
            
            let storeUrl = CoreDataService.documentsDirectory() + "/DataModel.sqlite"
            do{
                try persistentStoreCoordinator?.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: NSURL(fileURLWithPath: storeUrl), options: nil)
            }
            catch _ as NSError {
                abort()
            }
        }
        
        return persistentStoreCoordinator!
    }
    
    func getManagedObjectContext() -> NSManagedObjectContext! {
        let coordinator = self.getPersistentStoreCoordinator()
        managedObjectContext = NSManagedObjectContext()
        managedObjectContext?.persistentStoreCoordinator = coordinator
        
        
        return managedObjectContext
    }
    class func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDir = paths.firstObject as! String
        
        return documentsDir
    }
    

}
