//
//  Item.swift
//  Todoey
//
//  Created by Yadir Jimenez on 5/23/18.
//  Copyright © 2018 YadirJ. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
