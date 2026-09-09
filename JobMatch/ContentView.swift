import SwiftUI

struct ContentView: View {

    let matchJobUseCase = MatchJobUseCase()

    func getMatchResult(job: PartTimeJob) -> MatchResult? {
        do {
            return try matchJobUseCase.execute(
                job: job,
                student: sampleStudent
            )
        } catch {
            return nil
        }
    }

    var body: some View {
        NavigationStack {
            List(sampleJobs) { job in

                if let result = getMatchResult(job: job) {

                    NavigationLink(
                        destination: JobDetailView(job: job)
                    ) {
                        VStack(alignment: .leading) {

                            Text(job.title)
                                .font(.headline)

                            Text(job.location)
                                .font(.subheadline)

                            Text("Match score: " + String(result.score))
                                .font(.subheadline)

                            ForEach(result.reasons, id: \.self) { reason in
                                Text(reason)
                                    .font(.caption)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
