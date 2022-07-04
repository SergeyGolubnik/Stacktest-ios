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
                        StatistikView(titleBar: $titleBar)
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
                                modelTableView.selected = 1
                            }) {
                                VStack(spacing: 0) {
                                    Image("znaki_white")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: modelTableView.selected == 1 ? 60 : 40, height: modelTableView.selected == 1 ? 60 : 40)
                                        .clipped()
                                    if modelTableView.selected != 1 {
                                        Text("Знаки")
                                            .font(.system(size: 13))
                                    }
                                        
                                }
                                .foregroundColor(.white.opacity(0.6))
                                .frame(width: 60, height: 42)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                modelTableView.selected = 2
                            }) {
                                VStack(spacing: 0) {
                                    Image("bileti_white")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: modelTableView.selected == 2 ? 60 : 40, height: modelTableView.selected == 2 ? 60 : 40)
                                        .clipped()
                                    if modelTableView.selected != 2 {
                                        Text("Билеты")
                                            .font(.system(size: 13))
                                    }
                                }
                                .foregroundColor(.white.opacity(0.6))
                                .frame(width: 60, height: 42)
                            }
                            Spacer()
                            
                            Button(action: {
                                modelTableView.selected = 3
                            }) {
                                VStack(spacing: 0){
                                    
                                    Image("ucheba_white")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: modelTableView.selected == 3 ? 60 : 40, height: modelTableView.selected == 3 ? 60 : 40)
                                        .clipped()
                                    if modelTableView.selected != 3 {
                                        Text("Учеба")
                                            .font(.system(size: 13))
                                    }
                                }
                                .frame(width: 60, height: 42)
                                .foregroundColor(.white.opacity(0.6))
                            }
                            
                            
                            Spacer()
                            Button(action: {
                                modelTableView.selected = 4
                            }) {
                                VStack(spacing: 0) {
                                    Image("Stats_white")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: modelTableView.selected == 4 ? 60 : 40, height: modelTableView.selected == 4 ? 60 : 40)
                                        .clipped()
                                    if modelTableView.selected != 4 {
                                        Text("Стати-ка")
                                            .font(.system(size: 13))
                                    }
                                }
                                .foregroundColor(.white.opacity(0.6))
                                .frame(width: 60, height: 42)
                            }
                        }
                        .padding()
                        .padding(.horizontal, 20)
                        .background(Color.blueApp)
                    }
                }
                
                MenuSetings(setingsBool: $setingsBool)
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
                            .frame(width: 35, height: 35)
                            .clipped()
//                            .padding(.bottom)
                    }

                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        setingsBool.toggle()
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
//                            .padding(.bottom)
                    }

                }
            }
            .tolbarPopover(show: $popapSetings) {
                LocationViewPopower(exitBool: $popapSetings).environmentObject(modelTableView)
                    .animation(.easeOut, value: 0)
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

