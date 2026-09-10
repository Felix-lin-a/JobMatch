import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = JobViewModel()

    var body: some View {

        TabView {

            NavigationStack {

                List(sampleJobs, id: \.id) { job in

                    if let result = viewModel.getMatchResult(job: job) {

                        NavigationLink(
                            destination: JobDetailView(
                                job: job,
                                errorMessage: viewModel.saveErrorMessage,
                                onSave: {
                                    viewModel.saveJob(job: job)
                                }
                            )
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
            .tabItem {
                Image(systemName: "briefcase")
                Text("Jobs")
            }

            SavedJobsView(
                savedJobs: viewModel.savedJobs
            )
            .tabItem {
                Image(systemName: "bookmark")
                Text("Saved Jobs")
            }

            ProfileView(
                student: sampleStudent
            )
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}

#Preview {
    ContentView()
}
