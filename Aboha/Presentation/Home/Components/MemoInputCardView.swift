//
//  MemoInputCardView.swift
//  Aboha
//
//  Created by 김동현 on 4/20/25.
//

import SwiftUI

struct MemoInputCardView: View {
    @Binding var memo: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("오늘의 메모")
                .font(.headline)
                .foregroundColor(Color(.label))

            TextEditor(text: $memo)
                .frame(height: 150)
                .padding(8)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.separator))
                )
                .foregroundColor(Color(.label))
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
    @Previewable @State var memo = ""
    return MemoInputCardView(memo: $memo)
}
