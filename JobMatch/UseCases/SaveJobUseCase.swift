//
//  SaveJobUseCase.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 9/9/2026.
//

//
//  SaveJobUseCase.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 9/9/2026.
//

import Foundation

/// Errors that can occur when a student saves a part-time job.
enum SaveJobUseCaseError: Error {

    /// The job has already been added to the student's saved jobs.
    case alreadySaved
}

/// Saves a part-time job for a student.
///
/// This use case prevents the same job from being saved more than once.
struct SaveJobUseCase {

    /// Adds a job to the student's saved jobs.
    ///
    /// - Parameters:
    ///   - job: The part-time job the student wants to save.
    ///   - savedJobs: The student's currently saved jobs.
    /// - Returns: An updated list containing the newly saved job.
    /// - Throws: `SaveJobUseCaseError.alreadySaved` if the job is already saved.
    func execute(
        job: PartTimeJob,
        savedJobs: [PartTimeJob]
    ) throws -> [PartTimeJob] {

        for savedJob in savedJobs {
            if savedJob.id == job.id {
                throw SaveJobUseCaseError.alreadySaved
            }
        }

        var updatedSavedJobs = savedJobs
        updatedSavedJobs.append(job)

        return updatedSavedJobs
    }
}
