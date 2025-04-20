//
//  EmotionSelectorView.swift
//  Aboha
//
//  Created by 김동현 on 4/20/25.
//

import SwiftUI

struct EmotionSelectorView: View {
    @Binding var selectedEmotion: Emotion?

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("오늘의 감정")
                .font(.headline)
                .foregroundColor(Color(.label))

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(Emotion.allCases) { emotion in
                        emotionChip(for: emotion)
                    }
                }
                .padding(.vertical, 8)
            }
        }
        .padding(16)
        .background(
            Color(uiColor: UIColor { traitCollection in
                traitCollection.userInterfaceStyle == .dark
                ? UIColor.secondarySystemBackground
                : UIColor.systemBackground
            })
        )
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func emotionChip(for emotion: Emotion) -> some View {
        HStack(spacing: 6) {
            Text(emotion.emoji)
            Text(emotion.koreanTitle)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            selectedEmotion == emotion
            ? Color(hex: "#007AFF")
            : Color(uiColor: UIColor { trait in
                trait.userInterfaceStyle == .dark
                ? UIColor(hex: "#3A3A3C")
                : UIColor(hex: "#F0F0F0")
            })
        )
        .foregroundColor(selectedEmotion == emotion ? .white : Color(.label))
        .cornerRadius(20)
        .onTapGesture {
            selectedEmotion = emotion
        }
    }
}

#Preview {
    @Previewable @State var emotion: Emotion? = nil
    return EmotionSelectorView(selectedEmotion: $emotion)
}
