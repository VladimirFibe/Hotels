//
//  HotelStarsView.swift
//  Hotels
//
//  Created by Vladimir Fibe on 21.12.2023.
//

import SwiftUI

struct HotelStarsView: View {
    var body: some View {
        HStack(spacing: 2.0) {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15)
            Text("5")
            Text("Превосходно")
        }
        .font(.system(size: 16, weight: .medium))
        .foregroundStyle(AppColor.orange.color)
        .frame(height: 29)
        .padding(.horizontal, 10)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(AppColor.orangeBackground.color)
        )
    }
}

#Preview {
    HotelStarsView()
}
