//
//  ContentView.swift
//  JobMatch
//
//  Created by Tianqi Li's Macbook pro on 6/9/2026.
//

import SwiftUI

struct ContentView: View {
    
    let matchJobUseCase=MatchJobUseCase()
    
        var body: some View{
            List(sampleJobs) { job in
                let result = matchJobUseCase.execute(job: job, student: sampleStudent)
                
                VStack(alignment: .leading){
                    Text(job.title)
                        .font(.headline)
                    
                    Text(job.location)
                        .font(.subheadline)
                    
                    Text("Match score: " + String(result.score))
                        .font(.subheadline)
                    
                    ForEach(result.reasons, id: \.self){
                        reason in Text(reason)
                            .font(.caption)
                    }
                }
            }
        }
}
    


#Preview {
    ContentView()
}
