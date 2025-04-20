//
//  SaveButtonView.swift
//  Aboha
//
//  Created by 김동현 on 4/20/25.
//

import SwiftUI

struct SaveButtonView: View {
    var isEnabled: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("기록 저장하기")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isEnabled ? Color(hex: "#007AFF") : Color(.systemGray4))
                .foregroundColor(.white)
                .cornerRadius(12)
        }
        .disabled(!isEnabled)
    }
}

#Preview {
    SaveButtonView(isEnabled: true, action: {})
}
