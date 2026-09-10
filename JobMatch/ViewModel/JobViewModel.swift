//
//  JobViewModel.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 10/9/2026.
//

import SwiftUI
import Combine

final class JobViewModel: ObservableObject {

    @Published var savedJobs: [PartTimeJob] = []
    @Published var saveErrorMessage = ""

    let saveJobUseCase = SaveJobUseCase()
    let matchJobUseCase = MatchJobUseCase()

    func saveJob(job: PartTimeJob) {

        do {
            savedJobs = try saveJobUseCase.execute(
                job: job,
                savedJobs: savedJobs
            )

            saveErrorMessage = ""

        } catch {
            saveErrorMessage = "This job is already saved. Check your Saved Jobs list."
        }
    }

    func getMatchResult(job: PartTimeJob) -> MatchResult? {

        do {
            return try matchJobUseCase.execute(
                job: job,
                student: sampleStudent
            )

        } catch {
            return nil
        }
    }
}
