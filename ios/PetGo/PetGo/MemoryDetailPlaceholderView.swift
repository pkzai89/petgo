import SwiftUI

struct MemoryDetailPlaceholderView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Memory")
                        .font(.largeTitle).bold()
                    Text("Memory details")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Button(action: { dismiss() }) {
                    Image(systemName: "photo.on.rectangle.angled")
                        .font(.title2)
                        .foregroundColor(.primary)
                        .padding(8)
                }
            }
            .padding([.top, .horizontal])
            ScrollView {
                VStack(spacing: 24) {
                    Image(systemName: "photo.on.rectangle.angled")
                        .font(.system(size: 64))
                        .foregroundColor(.accentColor)
                        .padding(.top, 32)
                    Text("Details coming soon")
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .bottom)
    }
}
