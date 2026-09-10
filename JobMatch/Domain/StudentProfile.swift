//
//  StudentProfile.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 7/9/2026.
//

import Foundation

/// Represents a student's information used to find suitable part-time jobs.
///
/// A student profile contains the student's skills, available working days,
/// and preferred work location. This information is used by JobMatch
/// to calculate how well a job matches the student.
struct StudentProfile {

    /// The student's name.
    var name: String

    /// Skills that the student can offer to an employer.
    let skills: [String]

    /// Days when the student is available to work.
    let availableDays: [String]

    /// The location where the student prefers to work.
    let preferredLocation: String
}
