import SwiftUI

struct HomeView: View {

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {

                VStack(alignment: .leading, spacing: 6) {
                    Text("No pet selected")
                        .font(.headline)

                    Text("Add a pet to get started")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

                VStack(spacing: 16) {
                    placeholderSection(title: "Memories")
                    placeholderSection(title: "Reminders")
                    placeholderSection(title: "Nearby")
                }
            }
        }
    }

    private func placeholderSection(title: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)

            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.15))
                .frame(height: 120)
        }
        .padding(.horizontal)
    }
}
