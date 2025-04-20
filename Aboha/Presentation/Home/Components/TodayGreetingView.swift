//
//  TodayGreetingView.swift
//  Aboha
//
//  Created by 김동현 on 4/20/25.
//

import SwiftUI

struct TodayGreetingView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("오늘 하루 어땠나요?")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color(.label))

            Text(Date(), style: .date)
                .font(.subheadline)
                .foregroundColor(Color(.secondaryLabel))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            Color(uiColor: UIColor { traitCollection in
                traitCollection.userInterfaceStyle == .dark
                ? UIColor.secondarySystemBackground
                : UIColor.systemBackground
            })
        )
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1)
    }
}

#Preview {
    TodayGreetingView()
}
