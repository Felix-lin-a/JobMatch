//
//  MatchJobUseCase.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 7/9/2026.
//

import Foundation

struct MatchJobUseCase{
    
    func execute(job: PartTimeJob, student: StudentProfile) -> MatchResult{
        var score = 0
        var reasons: [String] = []
        
        for skill in job.requiredSkills {
            if student.skills.contains(skill){
                score += 20
                reasons.append("Skills match: \(skill)")
            }
        }
        
        for day in job.availableDays {
            if student.availableDays.contains(day){
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
