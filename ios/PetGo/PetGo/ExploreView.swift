import SwiftUI

struct ExploreView: View {

    @EnvironmentObject private var appState: AppState

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                // Header
                VStack(alignment: .leading, spacing: 4) {
                    Text("Explore")
                        .font(.title)
                        .fontWeight(.semibold)

                    Text("Pet-friendly places near you")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)

                // Search
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    Text("Search parks, cafes, vets…")
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal, 20)

                // Map placeholder
                VStack(spacing: 8) {
                    Image(systemName: "map.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.secondary)

                    Text("Map view coming soon")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(height: 220)
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray5))
                .cornerRadius(16)
                .padding(.horizontal, 20)

                // Category chips
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        CategoryChip(title: "Parks", selected: true)
                        CategoryChip(title: "Cafes")
                        CategoryChip(title: "Vets")
                        CategoryChip(title: "Groomers")
                        CategoryChip(title: "Shops")
                    }
                    .padding(.horizontal, 20)
                }

                // Places
                VStack(spacing: 14) {
                    PlaceRow(
                        name: "Greenwich Park",
                        category: "Park",
                        distance: "0.8 km away"
                    ) {
                        appState.activeModal = .placeDetail
                    }

                    PlaceRow(
                        name: "Paws & Coffee",
                        category: "Cafe",
                        distance: "1.2 km away"
                    ) {
                        appState.activeModal = .placeDetail
                    }

                    PlaceRow(
                        name: "City Vets",
                        category: "Vet",
                        distance: "2.0 km away"
                    ) {
                        appState.activeModal = .placeDetail
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 24)
            }
        }
        .background(Color(.systemGroupedBackground))
    }
}

// MARK: - Subviews

private struct CategoryChip: View {
    let title: String
    var selected: Bool = false

    var body: some View {
        Text(title)
            .font(.subheadline)
            .fontWeight(.semibold)
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(selected ? Color.blue : Color.clear)
            .foregroundColor(selected ? .white : .blue)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.blue, lineWidth: selected ? 0 : 1)
            )
            .cornerRadius(16)
    }
}

private struct PlaceRow: View {
    let name: String
    let category: String
    let distance: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Rectangle()
                    .fill(Color(.systemGray5))
                    .frame(width: 56, height: 56)
                    .cornerRadius(12)

                VStack(alignment: .leading, spacing: 4) {
                    Text(name)
                        .font(.headline)
                    Text(category)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(distance)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.05), radius: 4)
        }
    }
}
