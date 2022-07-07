//
//  CatalogViewCards.swift
//  Stacktest-ios
//
//  Created by СОВА on 29.06.2022.
//

import SwiftUI

struct CatalogViewCards: View {
    @State var arrayPdd = DBViewModel.share.pddRossii
    @EnvironmentObject var dbViewModel: DBViewModel
    @Binding var titleBar: String
    let columns = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]
    var body: some View {
            ScrollView (showsIndicators: false) {
                VStack{
                    if let pdd = dbViewModel.pddCategory.filter {$0.id == "54"}.first {
                        Text(pdd.title)
                        LazyVGrid(columns: columns, spacing: 10){
                            
                            ForEach(pdd.stackTest, id: \.id) { cat in
                                CatalogCell(title: cat.title, image: "https://stacktest.ru/\(cat.imgRek)")
                            }
                        }.padding()
                    }
                }.padding(.top)
                if let pdd = dbViewModel.pddCategory.filter {$0.id == "42" || $0.id == "44" || $0.id == "50"}.first {
                    
                    NavigationLink {
                        TestCardView(pdd: pdd)
                    } label: {
                        Text("Пройти экзамен")
                    }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blueApp)
                    .cornerRadius(5)
                    .padding()
                }
               
            }
            .padding(.vertical, 90)
                .onAppear {
                    titleBar = "Учебные карточки"
                }
            
    }
}

struct CatalogViewCards_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
