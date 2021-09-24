//
//  itemView.swift
//  Zaara
//
//  Created by Aaditya Singh on 23/08/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct itemView: View {
    
    @StateObject var HomeModel = HomeViewModel()
    var item: Item
    
    var body: some View {
        VStack{
            
            WebImage(url: URL(string: item.item_image))
                .resizable()
                .frame(width: 200, height: 300)
                .aspectRatio(contentMode: .fill)
            
            VStack(spacing: 8) {
                Text(item.item_name)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                HStack{
                    Text("$\(item.item_cost)")
                        .font(.body)
                        .foregroundColor(.black)
                        .fontWeight(.light)
                    //Spacer()
                }
        }
    }
}
}
//struct itemView_Previews: PreviewProvider {
//    static var previews: some View {
//        itemView()
//    }
//}
