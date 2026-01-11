import SwiftUI

struct ExploreView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Explore")
                        .font(.largeTitle)
                        .fontWeight(.semibold)

                    Text("Pet-friendly places near you")
                        .foregroundColor(.secondary)
                }

                searchBar

                mapPlaceholder

                categoryChips

                Button(action: { appState.activeModal = .addMemory }) {
                    placeCard("Greenwich Park", "Park", "0.8 km")
                }
                .buttonStyle(PlainButtonStyle())
                Button(action: { appState.activeModal = .addMemory }) {
                    placeCard("Paws & Coffee", "Cafe", "1.2 km")
                }
                .buttonStyle(PlainButtonStyle())
                Button(action: { appState.activeModal = .addMemory }) {
                    placeCard("City Vets", "Vet", "2.0 km")
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(20)
        }
        .background(Color(.systemGroupedBackground))
    }

    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            Text("Search parks, cafes, vets…")
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }

    private var mapPlaceholder: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray.opacity(0.2))
                .frame(height: 220)

            VStack(spacing: 8) {
                Image(systemName: "map.fill")
                    .font(.largeTitle)
                    .foregroundColor(.gray)

                Text("Map view coming soon")
                    .foregroundColor(.secondary)
            }
        }
    }

    private var categoryChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                chip("Parks", selected: true)
                chip("Cafes")
                chip("Vets")
                chip("Groomers")
                chip("Shops")
            }
        }
    }

    private func chip(_ title: String, selected: Bool = false) -> some View {
        Text(title)
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(selected ? Color.blue : Color.clear)
            .foregroundColor(selected ? .white : .primary)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.blue)
            )
            .cornerRadius(16)
    }

    private func placeCard(_ name: String, _ type: String, _ distance: String) -> some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 56, height: 56)

            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                Text(type)
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
        .shadow(color: .black.opacity(0.05), radius: 8)
    }
}
