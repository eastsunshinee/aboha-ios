//
//  Record.swift
//  Aboha
//
//  Created by 김동현 on 4/19/25.
//

import Foundation

struct Record: Identifiable, Equatable {
    let id: UUID
    let date: Date
    let photoURL: URL?
    let emotion: Emotion?
    let memo: String?
}

enum Emotion: String, CaseIterable, Identifiable {
    case peaceful
    case happy
    case nostalgic
    case calm
    case energetic
    
    var id: String { self.rawValue }
    
    var emoji: String {
        switch self {
        case .peaceful: return "🌿"
        case .happy: return "😊"
        case .nostalgic: return "🕰️"
        case .calm: return "🍃"
        case .energetic: return "🔥"
        }
    }
    
    var koreanTitle: String {
        switch self {
        case .peaceful: return "평온함"
        case .happy: return "행복함"
        case .nostalgic: return "향수"
        case .calm: return "차분함"
        case .energetic: return "에너지 넘침"
        }
    }
}
