import SwiftUI

struct FloatingAddButton: View {

    let action: () -> Void

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()

                Button(action: action) {
                    Image(systemName: "plus")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 56, height: 56)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 4)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 90) // clears tab bar
            }
        }
    }
}

#Preview {
    FloatingAddButton {
        print("FAB tapped")
    }
}
