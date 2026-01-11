import SwiftUI

struct MemoriesView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // Memory card 1
                Button {
                    appState.activeModal = .memoryDetail
                } label: {
                    MemoryCard(title: "Beach Day", subtitle: "Sunny walk by the sea")
                }

                // Memory card 2
                Button {
                    appState.activeModal = .memoryDetail
                } label: {
                    MemoryCard(title: "Vet Visit", subtitle: "Annual check-up")
                }

                // Memory card 3
                Button {
                    appState.activeModal = .memoryDetail
                } label: {
                    MemoryCard(title: "First Day Home", subtitle: "Welcome to the family")
                }

            }
            .padding(20)
        }
        .background(Color(.systemGroupedBackground))
    }
}

private struct MemoryCard: View {
    let title: String
    let subtitle: String

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemGray5))
                .frame(width: 64, height: 64)
                .overlay(
                    Image(systemName: "photo")
                        .foregroundColor(.gray)
                )

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 3)
    }
}
