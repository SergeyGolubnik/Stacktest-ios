//
//  TableView.swift
//  Stacktest-ios
//
//  Created by СОВА on 14.06.2022.
//

import SwiftUI

struct TableView: View {
    @State var selected = 0
    var body: some View {
        ZStack {
            if selected == 0 {
           Text("1")
            }
            if selected == 1 {
                Text("2")
            } else if selected == 3 {
                Text("3")
            } else if selected == 2 {
                Text("4")
            }
            VStack{
                
                Spacer()
                
                ZStack{
                    HStack{
     
                        Button(action: {
                            self.selected = 0
                        }) {
                            Image(systemName: self.selected == 0 ? "location.circle.fill" : "location.circle")
                                .font(.system(size: 25))
                        }.foregroundColor(self.selected == 0 ? .black : .gray)
                        Spacer(minLength: 20)
                        
                        Button(action: {
                            self.selected = 1
                        }) {
                            Image(systemName: self.selected == 1 ? "heart.fill" : "heart")
                                .font(.system(size: 25))
                        }.foregroundColor(self.selected == 1 ? .black : .gray)
                        Spacer()
                            .frame(width: 60)
                        
                        
                        Button(action: {
                            self.selected = 2
                        }) {
                            ZStack{
                                
                                Image(systemName: self.selected == 2 ? "bubble.left.and.bubble.right.fill" : "bubble.left.and.bubble.right")
                                    .font(.system(size: 25))

                            }
                        }.foregroundColor(self.selected == 2 ? .black : .gray)
                        
                        
                        Spacer(minLength: 20)
                        Button(action: {
                            self.selected = 3
                        }) {
                            Image(systemName: self.selected == 3 ? "person.circle.fill" : "person.circle")
                                .font(.system(size: 25))
                        }.foregroundColor(self.selected == 3 ? .black : .gray)
                    }
                    .padding()
                    .padding(.horizontal, 10)
                    .background(Color.blue)
                }
            }
            
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}

