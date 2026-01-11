
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                // Universal Top Bar Spacer (if needed)
                Spacer().frame(height: 12)
                // Header
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Profile")
                            .font(.largeTitle).bold()
                        Text("Your account and pets")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.title2.bold())
                            .foregroundColor(.secondary)
                            .padding(8)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                // Profile Summary Card
                VStack(spacing: 12) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(Color.white)
                            .shadow(color: Color(.black).opacity(0.08), radius: 8, x: 0, y: 2)
                        VStack(spacing: 16) {
                            Spacer().frame(height: 8)
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.gray.opacity(0.4))
                            // Email and status
                            VStack(spacing: 2) {
                                Text("user@example.com")
                                    .font(.body).bold()
                                    .foregroundColor(.primary)
                                Text(appState.authStatus == .loggedIn ? "Logged in" : "Not logged in")
                                    .font(.caption)
                                    .foregroundColor(appState.authStatus == .loggedIn ? .green : .secondary)
                            }
                            Spacer().frame(height: 8)
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal, 24)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 160)
                    .padding(.horizontal, 20)
                }
                .padding(.top, 16)
                // Pets Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Your pets")
                        .font(.headline)
                        .padding(.horizontal, 20)
                    Text("Manage pet profiles")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 20)
                    HStack {
                        Text("Your pets")
                            .font(.body)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: Color(.black).opacity(0.04), radius: 2, x: 0, y: 1)
                    .padding(.horizontal, 20)
                }
                .padding(.top, 24)
                // Account Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Account")
                        .font(.headline)
                        .padding(.horizontal, 20)
                    VStack(spacing: 12) {
                        AccountRow(title: "Account settings")
                        AccountRow(title: "Privacy & security")
                        AccountRow(title: "Subscriptions")
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.top, 24)
                // Session Section
                VStack(spacing: 0) {
                    Button(role: .destructive) {
                        appState.logOut()
                    } label: {
                        Text("Log out")
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: Color(.black).opacity(0.04), radius: 2, x: 0, y: 1)
                    .padding(.horizontal, 20)
                    .padding(.top, 32)
                }
                Spacer(minLength: 32)
            }
            .padding(.top, 24)
            .padding(.bottom, 0)
        }
    }
}

private struct AccountRow: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.body)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color(.black).opacity(0.04), radius: 2, x: 0, y: 1)
    }
}
