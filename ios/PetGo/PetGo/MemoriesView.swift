import SwiftUI

struct MemoriesView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Memories")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                    .padding(.top, 16)

                if appState.authStatus == .loggedIn {
                    VStack(spacing: 16) {
                        MemoryCard(title: "First Walk",
                                   subtitle: "A lovely walk in the park",
                                   icon: "leaf.fill")
                        MemoryCard(title: "Vet Visit",
                                   subtitle: "Annual check-up completed",
                                   icon: "stethoscope")
                        MemoryCard(title: "Play Time",
                                   subtitle: "Afternoon fun at home",
                                   icon: "pawprint.fill")
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                } else {
                    VStack(spacing: 16) {
                        Spacer().frame(height: 40)
                        HStack {
                            Spacer()
                            VStack(spacing: 16) {
                                Image(systemName: "heart.slash")
                                    .font(.system(size: 48))
                                    .foregroundColor(.gray)
                                Text("No memories yet")
                                    .font(.headline)
                                Text("Sign in to start saving moments with your pet")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                        }
                        Spacer(minLength: 120)
                    }
                }
            }
        }
        .background(Color(.systemGroupedBackground))
    }
}

private struct MemoryCard: View {
    let title: String
    let subtitle: String
    let icon: String

    var body: some View {
        Button {
            // UI-only navigation
        } label: {
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(Color.blue.opacity(0.15))
                        .frame(width: 44, height: 44)
                    Image(systemName: icon)
                        .foregroundColor(.blue)
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            .padding(16)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.05), radius: 6)
        }
    }
}
