//
//  CatalogViewTicket.swift
//  Stacktest-ios
//
//  Created by СОВА on 29.06.2022.
//

import SwiftUI

struct CatalogViewTicket: View {
    @State var arrayPdd = DBViewModel.share.pddRossii
    @EnvironmentObject var dbViewModel: DBViewModel
    @Binding var titleBar: String
    @State var exemBool = false
    let columns = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]
    var body: some View {
        if dbViewModel.pddCategory.count >= 3 {
            
            ScrollView {
                VStack{
                    if let pdd = dbViewModel.pddCategory[1] {
                        Text(pdd.title)
                        LazyVGrid(columns: columns, spacing: 10){
                            
                            ForEach(pdd.modelCategory, id: \.id) { cat in
                                CatalogCell(title: cat.title, image: "https://stacktest.ru/\(cat.image)")
                            }
                        }.padding()
                    }
                }.padding(.top)
                Button {
                    exemBool = true
                } label: {
                    Text("Пройти экзамен")
                }
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color.blueApp)
                .cornerRadius(5)
                .padding()
               
            }
            .padding(.vertical, 90)
                .onAppear {
                    titleBar = "Билеты"
                }
        } else {
            Text("Нет интернета")
        }
            
    }
}

struct CatalogViewTicket_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
