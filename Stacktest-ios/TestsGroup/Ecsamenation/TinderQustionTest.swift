//
//  TinderQustionTest.swift
//  Stacktest-ios
//
//  Created by СОВА on 12.07.2022.
//

import SwiftUI

struct TinderQustionTest: View {
    @EnvironmentObject var modelTest: EcsamViewModel
    @State var offset: CGFloat = 0
    @State var endSwipe: Bool = false
    var qustion: ModelQuestion
    var body: some View {
        GeometryReader{proxy in
            let size = proxy.size
            
            let index = CGFloat(modelTest.getIndex(testEx: qustion))
            // Showing Next two cards at top like a Stack...
            let topOffset = (index <= 2 ? index : 2) * 15
            
            ZStack{
                
                ExsameCartView(qustion: qustion)
                    .frame(width: size.width - topOffset, height: size.height)
                    .offset(y: -topOffset)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .onAppear {
                print(index)
            }
        }
        .offset(x: offset)
        .rotationEffect(.init(degrees: getRotation(angle: 8)))
        .contentShape(Rectangle().trim(from: 0, to: endSwipe ? 0 : 1))
        
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("ACTIONFROMBUTTON"), object: nil)) { data in

            guard let info = data.userInfo else{
                return
            }

            let id = info["id"] as? String ?? ""
            let rightSwipe = info["rightSwipe"] as? Bool ?? false
            let width = getRect().width - 50

            if qustion.id == id{

                // removing card...
                withAnimation{
                    offset = (rightSwipe ? width : -width) * 2
                    endSwipeActions()

                    if rightSwipe{
                        self.rightSwipe()
                    }
                    else{
                        leftSwipe()
                    }
                }
            }
        }
    }
    
    // Rotation...
    func getRotation(angle: Double)->Double{
        
        let rotation = (offset / (getRect().width - 50)) * angle
        
        return rotation
    }
    
    func endSwipeActions(){
        withAnimation(.none){endSwipe = true}
        
        // After the card is moved away removing the card from array to preserve the memory...
        
        // The delay time based on your animation duration...
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if let _ = modelTest.testExsame.first{
                
               let _ = withAnimation{
                   modelTest.testExsame.removeFirst()
                }
            }
        }
    }
    
    func leftSwipe(){
        // DO ACTIONS HERE...
        print("Left Swiped")
    }
    
    func rightSwipe(){
        // DO ACTIONS HERE...
        print("Right Swiped")
    }
    
}


extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
