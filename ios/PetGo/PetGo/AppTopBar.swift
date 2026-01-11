import SwiftUI

struct AppTopBar: View {

    @EnvironmentObject private var appState: AppState

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("PetGo")
                    .font(.headline)
                Text("For the love of pets")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Menu {
                Button("Profile") {
                    appState.activeModal = .profile
                }

                Button("Settings") {
                    appState.activeModal = .settings
                }

                Button("Notifications") {
                    appState.activeModal = .notifications
                }

                Divider()

                Button("Log out", role: .destructive) {
                    appState.authStatus = .loggedOut
                }
            } label: {
                Image(systemName: "line.3.horizontal")
                    .font(.system(size: 20, weight: .semibold))
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 12)
        .padding(.bottom, 10)
        .background(Color(.systemBackground))
    }
}
