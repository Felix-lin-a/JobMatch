//
//  MatchResult.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 7/9/2026.
//

import Foundation

/// Represents the result of matching a student with a part-time job.
///
/// The result provides a match score together with human-readable reasons
/// so that the student can understand why a job may or may not suit them.
struct MatchResult {

    /// The job that was evaluated for the student.
    let job: PartTimeJob

    /// The calculated suitability score for the job.
    let score: Int

    /// Explanations describing which student preferences matched the job.
    let reasons: [String]
}
