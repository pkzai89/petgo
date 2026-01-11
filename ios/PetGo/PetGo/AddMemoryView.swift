import SwiftUI

struct AddMemoryView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.title2.bold())
                            .foregroundColor(.primary)
                    }
                    Spacer()
                }
                .padding([.top, .leading, .trailing])
                Text("Add Memory")
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, -36)
                Spacer()
                Image(systemName: "photo.on.rectangle")
                    .font(.system(size: 64))
                    .foregroundColor(.accentColor)
                    .padding(.bottom, 16)
                Text("Add a new memory")
                    .font(.title2.bold())
                Text("This feature is coming soon.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 32)
                Spacer()
                Button(action: {}) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Capsule().fill(Color.accentColor))
                }
                .padding([.horizontal, .bottom])
            }
        }
    }
}
