import SwiftUI

struct AppEntryView: View {

    @ObservedObject var session: AppSession

    var body: some View {
        switch session.state {
        case .loggedOut:
            LoginView(session: session)

        case .onboarding:
            OnboardingView()

        case .home:
            RootView()
        }
    }
}
