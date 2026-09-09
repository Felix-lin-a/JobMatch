//
//  PartTimeJob.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 7/9/2026.
//

import Foundation

struct PartTimeJob:Identifiable{
    let id: UUID
    let title: String
    let company: String
    let location: String
    let hourlyRate: Double
    let requiredSkills: [String]
    let availableDays: [String]
}
