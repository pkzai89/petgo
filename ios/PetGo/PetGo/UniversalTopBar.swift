import SwiftUI

struct UniversalTopBar: View {
    var body: some View {
        ZStack {
            HStack {
                // Hamburger icon
                Button(action: {}) {
                    Image(systemName: "line.3.horizontal")
                        .font(.title2)
                        .foregroundColor(.primary)
                        .padding(.leading, 4)
                }
                Spacer()
                // App title
                Text("PetGo")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.accentColor)
                Spacer()
                // Plus button with badge
                ZStack(alignment: .topTrailing) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundColor(.accentColor)
                            .frame(width: 36, height: 36)
                            .background(Circle().fill(Color(.systemGray6)))
                    }
                    .padding(.trailing, 4)
                    // Green paw badge
                    Circle()
                        .fill(Color.green)
                        .frame(width: 16, height: 16)
                        .overlay(
                            Image(systemName: "pawprint.fill")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.white)
                        )
                        .offset(x: 10, y: -8)
                }
            }
            .padding(.horizontal, 16)
            .frame(height: 56)
            .background(Color(.systemBackground).ignoresSafeArea(edges: .top))
            .overlay(
                Divider()
                    .background(Color(.systemGray4)), alignment: .bottom
            )
        }
    }
}
