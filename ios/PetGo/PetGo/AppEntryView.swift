import SwiftUI

struct AppEntryView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        switch appState.authStatus {
        case .loggedOut:
            LoginView()
                .environmentObject(appState)
        case .loggedIn:
            RootView()
                .environmentObject(appState)
        }
    }
}
