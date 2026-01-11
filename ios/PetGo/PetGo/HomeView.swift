import SwiftUI

struct HomeView: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                // Pet Card
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 12) {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 56, height: 56)
                            .overlay(
                                Image(systemName: "pawprint.fill")
                                    .foregroundColor(.blue)
                            )

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Rex")
                                .font(.headline)

                            Text("Golden Retriever")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            Text("2 yrs • 28 kg")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Button {
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                                .font(.title3)
                        }
                    }

                    HStack(spacing: 12) {
                        Button("Details") {}
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.blue)
                            )

                        Button("Share") {}
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(Color.blue.opacity(0.15))
                            .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.05), radius: 8)

                // Reminders
                VStack(alignment: .leading, spacing: 12) {
                    Text("Reminders")
                        .font(.headline)

                    VStack(alignment: .leading, spacing: 6) {
                        Text("Vet appointment")
                            .font(.subheadline)
                            .foregroundColor(.white)

                        Text("Tomorrow • Rex")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding()
                    .background(Color.black)
                    .cornerRadius(12)
                }

                // Nearby
                VStack(alignment: .leading, spacing: 12) {
                    Text("Nearby")
                        .font(.headline)

                    VStack(spacing: 8) {
                        nearbyRow("Greenwich Park", "0.8 km")
                        nearbyRow("Paws & Coffee", "1.2 km")
                    }
                }

            }
            .padding(20)
        }
        .background(Color(.systemGroupedBackground))
    }

    private func nearbyRow(_ name: String, _ distance: String) -> some View {
        HStack {
            Text(name)
            Spacer()
            Text(distance)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}
