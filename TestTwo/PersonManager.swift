//
//  AddressManager.swift
//  TestTwo
//
//  Created by iONE on 11/14/15.
//  Copyright © 2015 Nguyen Van Thanh. All rights reserved.
//

import UIKit
import CoreData

private let AddressEntityName = "Address"
private let PersonEntityName = "Person"


class PersonManager: DataBaseManager {
    
    
    let sharedManager = PersonManager()
    
    
    init() {
        super.init(managedObjectContext: CoreDataService.sharedInstance.getManagedObjectContext())
    }
    
    func newPerson() -> Person {
        
        let person = NSEntityDescription.insertNewObjectForEntityForName(PersonEntityName, inManagedObjectContext: self.coreDataContext) as! Person
        
        return person
        
    }
    
    func addAddressForPerson(person: Person) -> Address{
        
        let addr = NSEntityDescription.insertNewObjectForEntityForName(AddressEntityName, inManagedObjectContext: self.coreDataContext) as! Address
        addr.person = person
        return addr
    }

}
