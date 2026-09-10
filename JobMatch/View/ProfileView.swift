//
//  ProfileView.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 10/9/2026.
//

import SwiftUI

struct ProfileView: View {

    @StateObject var viewModel: ProfileViewModel

    init(student: StudentProfile) {
        _viewModel = StateObject(
            wrappedValue: ProfileViewModel(student: student)
        )
    }

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            Text("Student Profile")
                .font(.title)

            Text("Name: " + viewModel.student.name)

            TextField(
                "Enter new name",
                text: $viewModel.student.name
            )
            .textFieldStyle(.roundedBorder)

            Text("Skills")
                .font(.headline)

            ForEach(viewModel.student.skills, id: \.self) { skill in
                Text(skill)
            }

            Text("Available Days")
                .font(.headline)

            ForEach(viewModel.student.availableDays, id: \.self) { day in
                Text(day)
            }

            Text("Preferred Location")
                .font(.headline)

            Text(viewModel.student.preferredLocation)

            Button("Update Profile") {
                viewModel.updateProfile()
            }

            Text(viewModel.errorMessage)
                .font(.caption)

            Spacer()
        }
        .padding()
    }
}
