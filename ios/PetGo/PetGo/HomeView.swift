import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TopSection()
                PetCardSection()
                ReminderSection()
                NearbySection()
            }
            .padding(.top, 16)
            .padding(.bottom, 24)
        }
        .background(Color(.systemGroupedBackground))
    }
}

// MARK: - Subviews

private struct TopSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("PetGo")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
        }
        .padding(.horizontal, 20)
    }
}

private struct PetCardSection: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        if appState.authStatus == .loggedIn {
            Button {
                appState.activeModal = .petDetail
            } label: {
                HStack(spacing: 16) {
                    Circle()
                        .fill(Color(.systemGray5))
                        .frame(width: 64, height: 64)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Richer")
                            .font(.headline)
                        Text("Dog · Pomeranian")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("2 yrs · 2.9 kg")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.blue)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.05), radius: 4)
            }
            .padding(.horizontal, 20)
        } else {
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(Color(.systemGray5))
                        .frame(width: 64, height: 64)
                    Image(systemName: "lock.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.gray)
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text("Sign in to see your pets")
                        .font(.headline)
                    Text("Create an account to manage pets, reminders, and memories")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.05), radius: 4)
            .padding(.horizontal, 20)
        }
    }
}

private struct ReminderSection: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Reminders")
                .font(.headline)
            Button {
                if appState.authStatus == .loggedIn {
                    appState.activeModal = .reminderDetail
                }
            } label: {
                HStack(spacing: 12) {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 10, height: 10)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Vet checkup")
                            .font(.subheadline)
                        Text("Tomorrow · Richer")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.05), radius: 4)

                .opacity(appState.authStatus == .loggedIn ? 1.0 : 0.4)
            }
            .disabled(appState.authStatus != .loggedIn)
            .padding(.horizontal, 20)
        }
    }
}

private struct NearbySection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Nearby")
                .font(.headline)

            HStack {
                Text("Parks")
                    .font(.subheadline)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
        }
        .padding(.horizontal, 20)
    }
}
