//
//  PopoverLocation.swift
//  Stacktest-ios
//
//  Created by СОВА on 29.06.2022.
//

import SwiftUI

extension View {
    func tolbarPopover<Content: View>(show: Binding<Bool>, @ViewBuilder content: @escaping ()->Content ) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack{
                    if show.wrappedValue {
                        content()
                            .padding()
                            .background(Color.whiteApp
                                            .clipShape(PathPopover())
                            )
                            .shadow(radius: 2)
                            .offset(x: -5)
                            .offset(y: 5)
                    }
                },
                alignment: .topTrailing
            )
    }
}
struct PopoverLocation_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
struct PathPopover: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {path in
            let pt1 = CGPoint(x: 0, y: 0)
            let pt2 = CGPoint(x: rect.width, y: 0)
            let pt3 = CGPoint(x: rect.width, y: rect.width * 3.5)
            let pt4 = CGPoint(x: 0, y: rect.width * 3.5)
            
            
            path.move(to: pt4)
            
            path.addArc(tangent1End: pt1, tangent2End: pt2, radius: 15)
            path.addArc(tangent1End: pt2, tangent2End: pt3, radius: 15)
            path.addArc(tangent1End: pt3, tangent2End: pt4, radius: 15)
            path.addArc(tangent1End: pt4, tangent2End: pt1, radius: 15)
            
            path.move(to: pt1)
            path.addLine(to: CGPoint(x: 100, y: 0))
            path.addLine(to: CGPoint(x: 125, y: 0))
            path.addLine(to: CGPoint(x: 132, y: -315))
            path.addLine(to: CGPoint(x: 140, y: 0))
        }
    }
}
