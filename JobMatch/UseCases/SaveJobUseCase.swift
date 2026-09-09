//
//  SaveJobUseCase.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 9/9/2026.
//

import Foundation

enum SaveJobUseCaseError: Error {
    case alreadySaved
}

struct SaveJobUseCase {
    
    func execute(
        job: PartTimeJob,
        savedJobs: [PartTimeJob]
    )throws -> [PartTimeJob] {
        
        for savedJob in savedJobs {
            if savedJob.id == job.id {
                throw SaveJobUseCaseError.alreadySaved
            }
        }
        
        var updatedSavedJobs = savedJobs
        updatedSavedJobs.append(job)
        
        return updatedSavedJobs
    }
}
