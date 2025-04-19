//
//  HomeViewModel.swift
//  Aboha
//
//  Created by 김동현 on 4/19/25.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    // MARK: - State

    @Published var selectedEmotion: Emotion?
    @Published var memo: String = ""
    @Published var photoURL: URL?

    // MARK: - Dependencies

    private let crateRecordUseCase: CreateRecordUseCase

    // MARK: - Init

    init(createRecordUseCase: CreateRecordUseCase) {
        self.crateRecordUseCase = createRecordUseCase
    }

    // MARK: - Actions

    func saveRecord() async throws {
        guard let emotion = selectedEmotion else {
            throw ValidationError.missingEmotion
        }

        let record = Record(id: UUID(), date: Date(), photoURL: photoURL, emotion: emotion, memo: memo)
        try await crateRecordUseCase.execute(record: record)
    }



}

enum ValidationError: Error {
    case missingEmotion
}
