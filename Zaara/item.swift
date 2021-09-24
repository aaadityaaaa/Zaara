//
//  item.swift
//  Zaara
//
//  Created by Aaditya Singh on 23/08/21.
//

import SwiftUI

struct Item: Identifiable {
    var id: String
    var item_name: String
    var item_cost: NSNumber
    var item_details: String
    var item_image: String
    var isAdded: Bool = false

}
