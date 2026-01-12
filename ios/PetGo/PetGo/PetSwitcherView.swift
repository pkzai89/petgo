import SwiftUI

struct PetSwitcherView: View {

    let pets: [Pet]
    let activePetID: String?
    let onSelect: (Pet) -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(pets) { pet in
                    Button {
                        onSelect(pet)
                    } label: {
                        VStack(spacing: 6) {
                            Circle()
                                .fill(pet.id == activePetID ? Color.blue : Color.gray.opacity(0.3))
                                .frame(width: 44, height: 44)
                                .overlay(
                                    Text(pet.name.prefix(1))
                                        .font(.headline)
                                        .foregroundColor(.white)
                                )

                            Text(pet.name)
                                .font(.caption)
                                .foregroundColor(.primary)
                        }
                        .padding(6)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(pet.id == activePetID ? Color.blue.opacity(0.15) : Color.clear)
                        )
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
