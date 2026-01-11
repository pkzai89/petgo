import SwiftUI

struct AppEntryView: View {
    @EnvironmentObject var session: AppSession

    var body: some View {
        switch session.state {
        case .loggedOut:
            LoginView()
                .environmentObject(session)
        case .onboarding:
            OnboardingView()
                .environmentObject(session)
        case .main:
            RootView()
                .environmentObject(session)
        }
    }
}
