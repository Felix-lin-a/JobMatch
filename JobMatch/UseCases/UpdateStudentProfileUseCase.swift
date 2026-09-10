//
//  UpdateStudentProfileUseCase.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 9/9/2026.
//

import Foundation

/// Errors that can occur when a student updates their JobMatch profile.
enum UpdateStudentProfileUseCaseError: Error {

    /// The student has not provided a name.
    case missingName

    /// The student has not provided any skills for job matching.
    case missingSkills
}

/// Updates the information used to match a student with suitable part-time jobs.
///
/// This use case ensures that the student's profile contains the essential
/// information required by JobMatch before an updated profile is accepted.
struct UpdateStudentProfileUseCase {

    /// Creates an updated student profile after validating the required information.
    ///
    /// - Parameters:
    ///   - name: The student's name.
    ///   - skills: The skills the student can offer to employers.
    ///   - availableDays: The days when the student is available to work.
    ///   - preferredLocation: The student's preferred work location.
    /// - Returns: A validated and updated student profile.
    /// - Throws: `UpdateStudentProfileUseCaseError.missingName` if the name is empty,
    ///   or `UpdateStudentProfileUseCaseError.missingSkills` if no skills are provided.
    func execute(
        name: String,
        skills: [String],
        availableDays: [String],
        preferredLocation: String
    ) throws -> StudentProfile {

        if name.isEmpty {
            throw UpdateStudentProfileUseCaseError.missingName
        }

        if skills.isEmpty {
            throw UpdateStudentProfileUseCaseError.missingSkills
        }

        return StudentProfile(
            name: name,
            skills: skills,
            availableDays: availableDays,
            preferredLocation: preferredLocation
        )
    }
}
