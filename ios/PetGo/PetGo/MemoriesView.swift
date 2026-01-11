import SwiftUI

struct MemoriesView: View {
    @State private var showMemoryDetail = false
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                VStack(alignment: .leading, spacing: 4) {
                    Text("Memories")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Your pet’s moments, saved forever")
                        .foregroundColor(.secondary)
                }

                // Featured memory
                ZStack(alignment: .bottomLeading) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(.systemGray5))
                        .frame(height: 200)

                    VStack(alignment: .leading, spacing: 4) {
                        Text("First Park Day")
                            .font(.headline)
                            .foregroundColor(.white)

                        Text("Jan 2026")
                            .foregroundColor(.white.opacity(0.9))
                            .font(.caption)
                    }
                    .padding()
                    .background(Color.black.opacity(0.35))
                    .cornerRadius(12)
                    .padding()
                }

                // Grid
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    Button(action: { showMemoryDetail = true }) {
                        MemoryTile(title: "Beach walk", icon: "sun.max.fill")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: { showMemoryDetail = true }) {
                        MemoryTile(title: "Vet visit", icon: "cross.case.fill")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: { showMemoryDetail = true }) {
                        MemoryTile(title: "Nap time", icon: "bed.double.fill")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: { showMemoryDetail = true }) {
                        MemoryTile(title: "Birthday", icon: "gift.fill")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: { showMemoryDetail = true }) {
                        MemoryTile(title: "Training day", icon: "rosette")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: { showMemoryDetail = true }) {
                        MemoryTile(title: "Rainy afternoon", icon: "cloud.rain.fill")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(20)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .sheet(isPresented: $showMemoryDetail) {
            MemoryDetailPlaceholderView()
        }
    }
}

struct MemoryTile: View {
    let title: String
    let icon: String

    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray5))
                    .frame(height: 80)
                Image(systemName: icon)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.blue)
            }
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 16)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color(.black).opacity(0.06), radius: 4, x: 0, y: 2)
    }
}
