//
//  Person+CoreDataProperties.swift
//  TestTwo
//
//  Created by Ulaai on 11/14/15.
//  Copyright © 2015 Nguyen Van Thanh. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var address: String?
    @NSManaged var birthdays: String?
    @NSManaged var dates: String?
    @NSManaged var emails: String?
    @NSManaged var firstname: String?
    @NSManaged var identifier: NSNumber?
    @NSManaged var lastname: String?
    @NSManaged var newfields: String?
    @NSManaged var phones: String?
    @NSManaged var adds: NSSet?
    @NSManaged var mail: NSSet?
    @NSManaged var newfield: NSSet?

}
