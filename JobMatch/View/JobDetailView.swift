//
//  JobDetailView.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 9/9/2026.
//

import SwiftUI

struct JobDetailView: View {

    let job: PartTimeJob
    let errorMessage: String
    let onSave: () -> Void

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            Text(job.title)
                .font(.title)

            Text(job.company)
                .font(.headline)

            Text("Location: " + job.location)

            Text("Hourly Rate: $" + String(job.hourlyRate))

            Text("Required Skills")
                .font(.headline)

            ForEach(job.requiredSkills, id: \.self) { skill in
                Text(skill)
            }

            Text("Available Days")
                .font(.headline)

            ForEach(job.availableDays, id: \.self) { day in
                Text(day)
            }

            Button("Save Job") {
                onSave()
            }

            Text(errorMessage)
                .font(.caption)

            Spacer()
        }
        .padding()
    }
}
