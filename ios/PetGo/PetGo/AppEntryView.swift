import SwiftUI

struct AppEntryView: View {

    @EnvironmentObject private var appState: AppState

    var body: some View {
        Group {
            switch appState.authStatus {

            case .loggedOut:
                LoginView()

            case .loggedIn:
                if appState.hasCompletedOnboarding {
                    RootView()
                } else {
                    AddPetView()
                }
            }
        }
    }
}
