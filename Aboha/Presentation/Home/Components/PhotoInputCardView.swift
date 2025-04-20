//
//  PhotoInputCardView.swift
//  Aboha
//
//  Created by 김동현 on 4/20/25.
//

import SwiftUI

struct PhotoInputCardView: View {
    var onSelectPhoto: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("사진 추가")
                .font(.headline)
                .foregroundColor(Color(.label))

            Button {
                onSelectPhoto()
            } label: {
                VStack {
                    Image(systemName: "photo.on.rectangle.angled")
                        .font(.system(size: 48))
                        .padding(.bottom, 8)

                    Text("사진 선택하기")
                        .font(.subheadline)
                        .foregroundColor(Color(hex: "#007AFF"))
                }
                .frame(maxWidth: .infinity, minHeight: 150)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
            }
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
    PhotoInputCardView(onSelectPhoto: {})
}
