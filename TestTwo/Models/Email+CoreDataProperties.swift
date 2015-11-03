//
//  Email+CoreDataProperties.swift
//  TestTwo
//
//  Created by Nguyen Van Thanh on 10/30/15.
//  Copyright © 2015 Nguyen Van Thanh. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Email {

    @NSManaged var email: String?
    @NSManaged var mail: Person?

}
