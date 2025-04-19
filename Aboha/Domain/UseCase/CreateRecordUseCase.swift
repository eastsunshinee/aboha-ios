//
//  CreateRecordUseCase.swift
//  Aboha
//
//  Created by 김동현 on 4/19/25.
//

import Foundation

protocol CreateRecordUseCase {
    func execute(record: Record) async throws

}

final class DefaultCreateRecordUseCase: CreateRecordUseCase {
    private let repository: RecordRepository

    init(repository: RecordRepository) {
        self.repository = repository
    }

    func execute(record: Record) async throws {
        try await repository.save(record: record)
    }
}
