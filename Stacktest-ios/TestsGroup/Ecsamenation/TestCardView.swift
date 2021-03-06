//
//  TestCardView.swift
//  Stacktest-ios
//
//  Created by СОВА on 05.07.2022.
//

import SwiftUI

struct TestCardView: View {
    @State var pdd: ModelCategory
    @State var exsamBool = false
    let columns = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]
    var ecsamModel = ExsamViewModel(category: nil, optonView: nil)
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    Text(pdd.title)
                    LazyVGrid(columns: columns, spacing: 10){
                        ForEach(pdd.modelCategory, id: \.id) { cat in
                            Button {
                                ecsamModel.category = cat
                                ecsamModel.optionView = 1
                                ecsamModel.title = "Экзамен"
                                ecsamModel.questionFor()
                                exsamBool.toggle()
                                
                            } label: {
                                CatalogCell(title: cat.title, image: "https://stacktest.ru/\(cat.image)")
                            }
                        }
                    }.padding()
                    
                }
                
            }
            .padding(.vertical)
            .navigationBarTitle("Пройти экзамен", displayMode: .inline)
            .navigationBarColor(UIColor(Color.blueApp))
            .fullScreenCover(isPresented: $exsamBool) {
                ExsamViev(modelEcsam: ecsamModel)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TestCardView_Previews: PreviewProvider {
    static var previews: some View {
        TestCardView(pdd: StaticArray.shared.arrayStaticGroup11[1])
    }
}
