//
//  SampleData.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 7/9/2026.
//

import Foundation

let sampleStudent = StudentProfile(
    name: "Alex",
    skills: ["Communication", "IT Support"],
    availableDays: ["Monday", "Wednesday", "Friday"],
    preferredLocation: "Sydeny CBD"
)

let sampleJob1 = PartTimeJob(
    id: UUID(),
    title: "IT Support Assistant",
    company: "Tech Solutions",
    location: "Sydney CBD",
    hourlyRate: 30.0,
    requiredSkills: ["IT Support", "Communication"],
    availableDays: ["Monday", "Wednesday", "Friday"]
)

let sampleJob2 = PartTimeJob(
    id: UUID(),
    title: "Cafe Assistant",
    company: "City Cafe",
    location: "Sydney CBD",
    hourlyRate: 25.0,
    requiredSkills: ["Communication", "Customer Service"],
    availableDays: ["Tuesday", "Friday"]
    
)

let sampleJob3 = PartTimeJob(
    id: UUID(),
    title: "Retail Assistant",
    company: "Fashion Store",
    location: "Parramatta",
    hourlyRate: 27.0,
    requiredSkills: ["Customer Service", "Sales"],
    availableDays: ["Saturday", "Sunday"]
)

let sampleJobs=[
    sampleJob1,
    sampleJob2,
    sampleJob3
]
    
