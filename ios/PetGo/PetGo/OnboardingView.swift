import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var appState: AppState
    @State private var pageIndex = 0

    var body: some View {
        TabView(selection: $pageIndex) {

            VStack(spacing: 24) {
                Spacer()
                Image(systemName: "pawprint.fill")
                    .font(.system(size: 56))
                    .foregroundColor(.blue)

                Text("Welcome to PetGo")
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("Let’s get started")
                    .foregroundColor(.secondary)

                Spacer()

                Button("Next") {
                    pageIndex = 1
                }
                .buttonStyle(.borderedProminent)
            }
            .tag(0)

            VStack(spacing: 24) {
                Spacer()
                Text("You’re all set!")
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("You can change things later.")
                    .foregroundColor(.secondary)

                Spacer()

                Button("Go to Home") {
                    appState.hasCompletedOnboarding = true
                }
                .buttonStyle(.borderedProminent)
            }
            .tag(1)
        }
        .tabViewStyle(.page)
    }
}
