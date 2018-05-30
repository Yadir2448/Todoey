//
//  Category.swift
//  Todoey
//
//  Created by Yadir Jimenez on 5/23/18.
//  Copyright © 2018 YadirJ. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
    
}
