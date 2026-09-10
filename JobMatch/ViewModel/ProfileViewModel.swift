//
//  ProfileViewModel.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 10/9/2026.
//

import SwiftUI
import Combine

final class ProfileViewModel: ObservableObject {

    @Published var student: StudentProfile
    @Published var errorMessage = ""

    let updateStudentProfileUseCase = UpdateStudentProfileUseCase()

    init(student: StudentProfile) {
        self.student = student
    }

    func updateProfile() {
        do {
            student = try updateStudentProfileUseCase.execute(
                name: student.name,
                skills: student.skills,
                availableDays: student.availableDays,
                preferredLocation: student.preferredLocation
            )

            errorMessage = ""

        } catch {
            errorMessage = "Name and skills cannot be empty"
        }
    }
}
