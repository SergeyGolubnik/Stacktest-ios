//
//  CatalogCell.swift
//  Stacktest-ios
//
//  Created by СОВА on 24.06.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CatalogCell: View {
    @State var title = "Тесты ПДД категории 'A''B''C'"
    @State var image = "https://stacktest.ru/images/categories/AB.png"
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            VStack(spacing: 0){
                WebImage(url: URL(string: image))
                    .resizable()
                    .placeholder(Image(systemName: "photo"))
                    .placeholder {
                        ProgressView()
                    }
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5)) // Fade Transition with duration
                    .scaledToFit()
                    .frame(width: 185, height: 120)
                    .clipped()
                    .padding(.bottom)
                Capsule()
                    .frame(width: 100, height: 2)
                    .foregroundColor(.blue)
                HStack{
                    Text(title)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(width: 180, height: 70)
                    
                }
            }
        }
        .frame(width: 185, height: 230)
        .cornerRadius(10)
        .shadow(radius: 1)
        
            
    }
}

struct CatalogCell_Previews: PreviewProvider {
    static var previews: some View {
        CatalogCell()
    }
}
