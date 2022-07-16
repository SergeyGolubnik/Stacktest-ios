//
//  TicketsPDDCategory.swift
//  Stacktest-ios
//
//  Created by СОВА on 04.07.2022.
//

import SwiftUI

struct TicketsPDDCategory: View {
    @Environment(\.presentationMode) var presentation
    @State var modelTest: ModelCategory
    @State var testBool = false
    var ecsamModel = ExsamViewModel(category: nil, optonView: nil)
    let columns = [GridItem(.flexible(), spacing: 10),
                   GridItem(.flexible(), spacing: 10),
                   GridItem(.flexible(), spacing: 10),
                   GridItem(.flexible(), spacing: 10)]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10){
                    ForEach(modelTest.test, id: \ .id) { test in
                        Button {
                            ecsamModel.category = modelTest
                            ecsamModel.optionView = 2
                            ecsamModel.title = "Билет \(test.title)"
                            ecsamModel.questionFor()
                            testBool.toggle()
                        } label: {
                            TicketsPDDCategoryCell(idTest: test.title)
                                .foregroundColor(.black)
                        }
                    }
                }.padding(30)
            }
            .navigationBarTitle(modelTest.title, displayMode: .inline)
            .navigationBarColor(UIColor(Color.blueApp))
            .fullScreenCover(isPresented: $testBool) {
                ExsamViev(modelEcsam: ecsamModel)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TicketsPDDCategory_Previews: PreviewProvider {
    static var previews: some View {
        TicketsPDDCategory(modelTest: StaticArray.shared.arrayStaticGroup11[1])
    }
}
