//
//  RecordRepository.swift
//  Aboha
//
//  Created by 김동현 on 4/19/25.
//

import Foundation

protocol RecordRepository {
    func save(record: Record) async throws
}

