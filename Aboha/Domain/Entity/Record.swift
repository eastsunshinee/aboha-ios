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
}
