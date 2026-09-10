//
//  SavedJobsView.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 10/9/2026.
//

import SwiftUI

struct SavedJobsView: View {
     
    let savedJobs: [PartTimeJob]
    
    var body: some View {
        List(savedJobs) { job in
            Text(job.title)
        }
    }
}

