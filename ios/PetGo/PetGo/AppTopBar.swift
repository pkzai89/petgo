
import SwiftUI

struct AppTopBar: View {
    @State private var showMenu = false
    @EnvironmentObject private var appState: AppState

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: { showMenu = true }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(.primary)
                }
                Spacer()
                Text("PetGo")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(Color.blue)
                Spacer()
                HStack(spacing: 12) {
                    ZStack {
                        Circle()
                            .fill(Color(.systemGray6))
                            .frame(width: 32, height: 32)
                        Image(systemName: "plus")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.primary)
                    }
                    ZStack {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 20, height: 20)
                        Image(systemName: "pawprint.fill")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.horizontal, 20)
            .frame(height: 56)
            Divider()
                .background(Color(.separator))
        }
        .background(Color(.systemBackground))
        .sheet(isPresented: $showMenu) {
            MenuSheet(
                onProfile: {
                    showMenu = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        if appState.authStatus == .loggedOut {
                            appState.activeModal = .login
                        } else {
                            appState.activeModal = .profile
                        }
                    }
                },
                onSettings: {
                    showMenu = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        if appState.authStatus == .loggedOut {
                            appState.activeModal = .login
                        } else {
                            appState.activeModal = .settings
                        }
                    }
                },
                onNotifications: {
                    showMenu = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        if appState.authStatus == .loggedOut {
                            appState.activeModal = .login
                        } else {
                            appState.activeModal = .notifications
                        }
                    }
                },
                onHelp: {
                    showMenu = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { appState.activeModal = .help }
                }
            )
            .presentationDetents([.medium])
        }
    }
}

struct MenuSheet: View {
    let onProfile: () -> Void
    let onSettings: () -> Void
    let onNotifications: () -> Void
    let onHelp: () -> Void

    @EnvironmentObject private var appState: AppState

    var body: some View {
        VStack(spacing: 0) {
            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(Color(.systemGray4))
                .padding(.top, 8)
                .padding(.bottom, 16)
            VStack(spacing: 0) {
                MenuRow(icon: "person.crop.circle", title: "Profile", action: onProfile)
                MenuRow(icon: "gearshape", title: "Settings", action: onSettings)
                MenuRow(icon: "bell", title: "Notifications", action: onNotifications)
                MenuRow(icon: "questionmark.circle", title: "Help", action: onHelp)
                MenuRow(icon: "rectangle.portrait.and.arrow.right", title: "Log out", action: {
                    appState.logOut()
                    appState.activeModal = nil
                })
            }
            .background(Color(.systemBackground))
            .cornerRadius(18)
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
            Spacer()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

struct MenuRow: View {
    let icon: String
    let title: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .frame(width: 32)
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(14)
        }
        .padding(.vertical, 4)
    }
}

struct AppTopBar_Previews: PreviewProvider {
    static var previews: some View {
        AppTopBar()
    }
}
