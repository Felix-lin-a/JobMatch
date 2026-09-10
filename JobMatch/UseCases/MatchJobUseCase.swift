//
//  MatchJobUseCase.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 7/9/2026.
//

import Foundation

/// Errors that can occur when matching a student with a part-time job.
enum MatchJobError: Error {
    /// The student's profile does not contain any skills for job matching.
    case missingSkills
}

/// Calculates how suitable a part-time job is for a student.
///
/// The matching score is based on the student's skills, available working
/// days, and preferred work location.
struct MatchJobUseCase {

    /// Evaluates a part-time job against a student's profile.
    ///
    /// - Parameters:
    ///   - job: The part-time job to evaluate.
    ///   - student: The student looking for suitable work.
    /// - Returns: A match result containing the score and matching reasons.
    /// - Throws: `MatchJobError.missingSkills` when the student has no skills.
    func execute(job: PartTimeJob, student: StudentProfile) throws -> MatchResult {

        if student.skills.isEmpty {
            throw MatchJobError.missingSkills
        }

        var score = 0
        var reasons: [String] = []

        for skill in job.requiredSkills {
            if student.skills.contains(skill) {
                score += 20
                reasons.append("Skills match: \(skill)")
            }
        }

        for day in job.availableDays {
            if student.availableDays.contains(day) {
                score += 10
                reasons.append("Available on: \(day)")
            }
        }

        if job.location == student.preferredLocation {
            score += 20
            reasons.append("Preferred location match")
        }

        return MatchResult(
            job: job,
            score: score,
            reasons: reasons
        )
    }
}
