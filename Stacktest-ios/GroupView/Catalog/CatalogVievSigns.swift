//
//  CatalogViev.swift
//  Stacktest-ios
//
//  Created by СОВА on 23.06.2022.
//

import SwiftUI

struct CatalogVievSigns: View {
    @EnvironmentObject var dbViewModel: DBViewModel
    @Binding var titleBar: String
    @State var shareTest = false
    let columns = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]
    var body: some View {
            
            ScrollView (showsIndicators: false) {
                VStack{
                    if let pdd = dbViewModel.pddCategory.filter {$0.id == "16" || $0.id == "17" || $0.id == "18"}.first {
                        Text(pdd.title)
                        LazyVGrid(columns: columns, spacing: 10){
                            ForEach(pdd.stackTest, id: \.id) { cat in
                                Button {
                                    shareTest.toggle()
                                } label: {
                                    CatalogCell(title: cat.title, image: "https://stacktest.ru/\(cat.imgRek)")
                                }
                                
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
                titleBar = "Знаки"
            }
        
        
    }
}

struct CatalogViev_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}

