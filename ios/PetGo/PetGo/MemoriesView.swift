import SwiftUI

struct MemoriesView: View {

    @EnvironmentObject var appState: AppState

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Text("Memories")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 12)

                ForEach(0..<3, id: \.self) { _ in
                    Button {
                        appState.activeModal = .memoryDetail
                    } label: {
                        VStack(alignment: .leading, spacing: 8) {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 180)

                            Text("A happy memory")
                                .font(.headline)

                            Text("Tap to view details")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.05), radius: 8)
                    }
                }
            }
            .padding(20)
        }
        .background(Color(.systemGroupedBackground))
    }
}
