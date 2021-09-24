//
//  CartModel.swift
//  Zaara
//
//  Created by Aaditya Singh on 23/08/21.
//

import SwiftUI


struct Cart: Identifiable {
    
    var id = UUID().uuidString
    var item: Item
    var quantity: Int
    
    
}
