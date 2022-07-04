//
//  TicketsPDDCategoryCell.swift
//  Stacktest-ios
//
//  Created by СОВА on 04.07.2022.
//

import SwiftUI

struct TicketsPDDCategoryCell: View {
    @State var idTest = "1"
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.width / 5)
                .cornerRadius(5)
                .shadow(radius: 3)
            Text(idTest)
                .font(.title)
        }
    }

}

struct TicketsPDDCategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        TicketsPDDCategoryCell()
    }
}

