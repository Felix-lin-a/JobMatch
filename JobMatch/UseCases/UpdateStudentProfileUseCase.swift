//
//  UpdateStudentProfileUseCase.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 9/9/2026.
//

import Foundation

enum UpdateStudentProfileUseCaseError: Error {
    case missingName
    case misiingSkills
}

struct UpdateStudentProfileUseCase {
    
    func execute(
        name: String,
        skills: [String],
        availableDays: [String],
        preferredLocation: String
    )throws -> StudentProfile {
        
        if name.isEmpty {
            throw UpdateStudentProfileUseCaseError.missingName
        }
        
        if skills.isEmpty {
            throw UpdateStudentProfileUseCaseError.misiingSkills
        }
        
        return StudentProfile(
            name: name,
            skills: skills,
            availableDays: availableDays,
            preferredLocation: preferredLocation
        )
    }
}
