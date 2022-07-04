//
//  TicketsPDDCategory.swift
//  Stacktest-ios
//
//  Created by СОВА on 04.07.2022.
//

import SwiftUI

struct TicketsPDDCategory: View {
    @Environment(\.presentationMode) var presentation
    @State var modelTest = [ModelTest]()
    @State var nameGroup = ""
    let columns = [GridItem(.flexible(), spacing: 10),
                   GridItem(.flexible(), spacing: 10),
                   GridItem(.flexible(), spacing: 10),
                   GridItem(.flexible(), spacing: 10)]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10){
                    ForEach(modelTest, id: \ .id) { test in
                        Button {
                            
                        } label: {
                            TicketsPDDCategoryCell(idTest: test.title)
                                .foregroundColor(.black)
                        }
                    }
                }.padding(30)
            }
            .navigationBarTitle(nameGroup, displayMode: .inline)
            .navigationBarColor(UIColor(Color.blueApp))
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TicketsPDDCategory_Previews: PreviewProvider {
    static var previews: some View {
        TicketsPDDCategory(modelTest: [ModelTest(), ModelTest()], nameGroup: "Test")
    }
}
