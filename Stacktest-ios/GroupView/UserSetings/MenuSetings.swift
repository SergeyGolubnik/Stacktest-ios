//
//  MenuSetings.swift
//  Stacktest-ios
//
//  Created by СОВА on 30.06.2022.
//

import SwiftUI

struct MenuSetings: View {
    @State var selectet = 0
    @State var shouBool = false
    @State var offset: CGFloat = 0
    @Binding var setingsBool: Bool
    var body: some View {
        ZStack {
            if setingsBool {
                Rectangle()
                    .fill(
                        Color.primary.opacity(0.01)
                    )
                    .ignoresSafeArea(.container, edges: .vertical)
                    .onTapGesture {
                        withAnimation {
                            setingsBool.toggle()
                        }
                    }
            }
            VStack(alignment: .leading, spacing: 0) {
                Button {
                    selectet = 1
                    shouBool = true
                } label: {
                    HStack(spacing: 20) {
                        Image("User")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                        
                        Text("Профиль")
                            .fontWeight(.light)
                            .foregroundColor(.blueApp)
                            .font(.system(size: 30))
                        Spacer()
                    }.padding()
                }
                Button {
                    selectet = 2
                    shouBool = true
                } label: {
                    HStack(spacing: 20) {
                        Image("Stats")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                        
                        Text("Статистика")
                            .fontWeight(.light)
                            .foregroundColor(.blueApp)
                            .font(.system(size: 30))
                        Spacer()
                    }.padding()
                }
                Button {
                    selectet = 3
                    shouBool = true
                } label: {
                    HStack(spacing: 20) {
                        Image("Star")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                        
                        Text("Избранное")
                            .fontWeight(.light)
                            .foregroundColor(.blueApp)
                            .font(.system(size: 30))
                        Spacer()
                    }.padding()
                }
                Button {
                    selectet = 4
                    shouBool = true
                } label: {
                    HStack(spacing: 20) {
                        Image("Share")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                        
                        Text("Поделится")
                            .fontWeight(.light)
                            .foregroundColor(.blueApp)
                            .font(.system(size: 30))
                        Spacer()
                    }.padding()
                }
                Button {
                    selectet = 5
                    shouBool = true
                } label: {
                    HStack(spacing: 20) {
                        Image(systemName: "bubble.left")
                            .font(.system(size: 30))
                            .foregroundColor(.blueApp)
                        
                        Text("Оставить отзыв")
                            .fontWeight(.light)
                            .foregroundColor(.blueApp)
                            .font(.system(size: 30))
                        Spacer()
                    }.padding()
                }
                Button {
                    selectet = 6
                    shouBool = true
                } label: {
                    HStack(spacing: 20) {
                        Image("earth")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                        
                        Text("Выбор страны")
                            .fontWeight(.light)
                            .foregroundColor(.blueApp)
                            .font(.system(size: 30))
                        Spacer()
                    }.padding()
                }
            }
            .frame(width: offset)
            .frame(maxHeight: .infinity)
            .background(
                Color.whiteApp.ignoresSafeArea(.container, edges: .vertical)
            )
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .animation(.easeOut, value: offset)
//        .padding()
        
        .onChange(of: setingsBool, perform: { newValue in
            if newValue {
                offset = UIScreen.main.bounds.width - 90
            } else {
                offset = 0
            }
        })
    }
}

struct MenuSetings_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
