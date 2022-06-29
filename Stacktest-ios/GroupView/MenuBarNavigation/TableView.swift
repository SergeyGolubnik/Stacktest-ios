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
    @State var popapSetings = false
    @State var setingsBool = false
    @State var locale = UserDefaults.standard.string(forKey: "Location") ?? "ru"
    
    var body: some View {
        NavigationView{
            
            ZStack {
                if modelTableView.arrayBool {
                    
                    switch modelTableView.selected {
                    case 1:
                        CatalogVievSigns(titleBar: $titleBar).environmentObject(modelTableView)
                    case 2:
                        CatalogViewTicket(titleBar: $titleBar).environmentObject(modelTableView)
                    case 3:
                        CatalogViewCards(titleBar: $titleBar).environmentObject(modelTableView)
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
//                            Button(action: {
//                                modelTableView.selected = 0
//                                titleBar = "Каталог"
//                            }) {
//                                VStack{
//                                    Image(systemName: modelTableView.selected == 0 ? "doc.text" : "doc.text")
//                                        .font(.system(size: 32))
//                                    Text("Каталог")
//                                        .font(.system(size: 13))
//                                }
//                            }.foregroundColor(modelTableView.selected == 0 ? .white.opacity(0.6): .black)
//                            Spacer()
                            Button(action: {
                                modelTableView.selected = 1
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
                                .frame(width: 60, height: 42)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                modelTableView.selected = 2
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
                            .frame(width: 60, height: 42)
                            Spacer()
                            
                            Button(action: {
                                modelTableView.selected = 3
                            }) {
                                VStack(spacing: 0){
                                    
                                    Image(modelTableView.selected == 3 ? "ucheba_white" : "ucheba")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipped()
                                    Text("Учеба")
                                        .font(.system(size: 13))
                                        .frame(width: 60, height: 14)
                                }
                            }
                            .frame(width: 60, height: 42)
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
                                    Text("Стати-ка")
                                        .font(.system(size: 13))
                                }
                            }
                            .foregroundColor(modelTableView.selected == 4 ? .white.opacity(0.6) : .blue)
                            .frame(width: 60, height: 42)
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        popapSetings.toggle()
                    } label: {
                        Image(modelTableView.locale == "ru" ? "russia1" : modelTableView.locale == "uk" ? "ukraine" : modelTableView.locale == "en" ? "estonia" : "russia1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                            .padding(.bottom)
                    }

                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        setingsBool.toggle()
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                            .padding(.bottom)
                    }

                }
            }
            .tolbarPopover(show: $popapSetings) {
                LocationViewPopower(exitBool: $popapSetings).environmentObject(modelTableView)
            }
            
           
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}

