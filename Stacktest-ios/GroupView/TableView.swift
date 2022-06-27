//
//  TableView.swift
//  Stacktest-ios
//
//  Created by СОВА on 14.06.2022.
//

import SwiftUI

struct TableView: View {
    @ObservedObject var modelTableView = DBViewModel()
    @State var titleBar = ""
    var body: some View {
        NavigationView{
            
            ZStack {
                if modelTableView.arrayBool {
                    
                    switch modelTableView.selected {
                    case 0:
                        Text("\(modelTableView.pddCategory[0].title)")
                    case 1:
                        Text("2")
                    case 2:
                        Text("3")
                    case 3:
                        Text("4")
                    case 4:
                        Text("5")
                    default:
                        Text("1")
                    }
                } else {
                    ProgressView()
                }
                
                VStack{
                    
                    Spacer()
                    
                    ZStack{
                        HStack{
                            Button(action: {
                                modelTableView.selected = 0
                                titleBar = "Каталог"
                            }) {
                                VStack{
                                    Image(systemName: modelTableView.selected == 0 ? "doc.text" : "doc.text")
                                        .font(.system(size: 32))
                                    Text("Каталог")
                                        .font(.system(size: 13))
                                }
                            }.foregroundColor(modelTableView.selected == 0 ? .white.opacity(0.6): .black)
                            Spacer()
                            Button(action: {
                                modelTableView.selected = 1
                                titleBar = "Знаки"
                            }) {
                                VStack(spacing: 0) {
                                    Image(modelTableView.selected == 1 ? "znaki_white" : "znaki")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipped()
                                    
                                    Text("Знаки")
                                        .font(.system(size: 13))
                                }
                                .foregroundColor(modelTableView.selected == 1 ? .white.opacity(0.6) : .blue)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                modelTableView.selected = 2
                                titleBar = "Билеты"
                                UserDefaults.standard.set("uk", forKey: "Location")
                                modelTableView.locale = "uk"
                                modelTableView.pddCategoryPry()
                            }) {
                                VStack(spacing: 0) {
                                    Image(modelTableView.selected == 2 ? "bileti_white" : "bileti")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipped()
                                    Text("Билеты")
                                        .font(.system(size: 13))
                                }
                            }
                            .foregroundColor(modelTableView.selected == 2 ? .white.opacity(0.6) : .blue)
                            Spacer()
                            
                            Button(action: {
                                modelTableView.selected = 3
                                titleBar = "Учеба"
                                UserDefaults.standard.set("ru", forKey: "Location")
                                modelTableView.locale = "ru"
                                modelTableView.pddCategoryPry()
                            }) {
                                VStack(spacing: 0){
                                    
                                    Image(modelTableView.selected == 3 ? "ucheba_white" : "ucheba")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipped()
                                    Text("Учеба")
                                        .font(.system(size: 13))
                                }
                            }
                            .foregroundColor(modelTableView.selected == 3 ? .white.opacity(0.6) : .blue)
                            
                            
                            Spacer()
                            Button(action: {
                                modelTableView.selected = 4
                                titleBar = "Статистика"
                            }) {
                                VStack(spacing: 0) {
                                    Image(modelTableView.selected == 4 ? "Stats_white" : "Stats")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipped()
                                    Text("Статистика")
                                        .font(.system(size: 13))
                                }
                            }
                            .foregroundColor(modelTableView.selected == 4 ? .white.opacity(0.6) : .blue)
                        }
                        .padding()
                        .padding(.horizontal, 20)
                        .background(Color.blueApp)
                    }
                }
                
            }
            .ignoresSafeArea()
            .navigationBarTitle(titleBar, displayMode: .inline)
            .navigationBarColor(UIColor(Color.blueApp))
        }
        .navigationViewStyle(StackNavigationViewStyle())
            
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}

