//
//  Address+CoreDataProperties.swift
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

extension Address {

    @NSManaged var city: String?
    @NSManaged var country: String?
    @NSManaged var identifier: String?
    @NSManaged var postcode: String?
    @NSManaged var province: String?
    @NSManaged var street1: String?
    @NSManaged var street2: String?
    @NSManaged var person: Person?

}
