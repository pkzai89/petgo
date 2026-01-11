import SwiftUI

struct AppEntryView: View {

    @EnvironmentObject private var appState: AppState

    var body: some View {
        Group {
            if !appState.isAuthenticated {
                LoginView()
            } else if !appState.hasCompletedOnboarding {
                OnboardingView()
            } else {
                RootView()
            }
        }
    }
}
