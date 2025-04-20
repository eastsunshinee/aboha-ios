//
//  HomeView.swift
//  Aboha
//
//  Created by 김동현 on 4/20/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 15) {
                    TodayGreetingView()

                    EmotionSelectorView(selectedEmotion: $viewModel.selectedEmotion)

                    MemoInputCardView(memo: $viewModel.memo)

                    PhotoInputCardView {
                        // TODO: 사진 선택 기능 연결 예정
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 8)
            }
            .background(Color(.systemGroupedBackground))
            .safeAreaInset(edge: .bottom) {
                SaveButtonView(
                    isEnabled: viewModel.selectedEmotion != nil,
                    action: {
                        Task {
                            do {
                                try await viewModel.saveRecord()
                                print("기록 저장 완료")
                            } catch {
                                print("기록 저장 실패: \(error)")
                            }
                        }
                    }
                )
                .padding()
            }
            .navigationTitle("오늘의 기록")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let mockUseCase = MockCreateRecordUseCase()
    let viewModel = HomeViewModel(createRecordUseCase: mockUseCase)
    HomeView(viewModel: viewModel)
}

final class MockCreateRecordUseCase: CreateRecordUseCase {
    func execute(record: Record) async throws {
        print("Mock 저장됨: \(record)")
    }
}
