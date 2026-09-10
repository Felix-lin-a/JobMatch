//
//  PartTimeJob.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 7/9/2026.
//

import Foundation

/// Represents a part-time job available to a student.
///
/// The job contains information used by JobMatch to evaluate whether
/// the position matches a student's skills, availability, and preferences.
struct PartTimeJob: Identifiable {

    /// A unique identifier for the job.
    let id: UUID

    /// The title of the part-time position.
    let title: String

    /// The company offering the position.
    let company: String

    /// The location of the job.
    let location: String

    /// The hourly pay offered for the position.
    let hourlyRate: Double

    /// The skills required for the position.
    let requiredSkills: [String]

    /// The days when the student needs to be available.
    let availableDays: [String]
}
