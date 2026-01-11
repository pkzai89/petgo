import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // TOP BAR
                HStack {
                    Image(systemName: "line.3.horizontal")
                        .font(.title2)
                        .foregroundColor(.primary)
                    Spacer()
                    Text("PetGo")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.blue)
                    Spacer()
                    ZStack(alignment: .bottomTrailing) {
                        Circle()
                            .fill(Color(.systemGray5))
                            .frame(width: 36, height: 36)
                        Image(systemName: "pawprint.fill")
                            .resizable()
                            .foregroundColor(.green)
                            .frame(width: 14, height: 14)
                            .background(Circle().fill(Color.white))
                            .offset(x: 6, y: 6)
                    }
                }
                .padding(.horizontal, 4)
                .padding(.top, 24) // Increased top padding for breathing room

                // PET CARD
                ZStack(alignment: .topTrailing) {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(alignment: .center, spacing: 16) {
                            Circle()
                                .fill(Color(.systemGray4))
                                .frame(width: 64, height: 64)
                                .overlay(
                                    Image(systemName: "photo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(.gray)
                                )
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Charlie")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("Golden Retriever")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text("2 yrs • 28 kg")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                        }
                        .padding(.top, 16)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 8)

                        Divider()
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)

                        HStack(spacing: 12) {
                            Button(action: {}) {
                                Text("Details")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundColor(.blue)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 24)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(Color(.systemGray6))
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.blue, lineWidth: 1.5)
                                    )
                            }
                            Button(action: {}) {
                                Text("Share")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 24)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(Color.blue.opacity(0.15))
                                    )
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                        .padding(.top, 4)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.white)
                            .shadow(color: Color(.black).opacity(0.07), radius: 8, x: 0, y: 4)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(Color(.systemGray5), lineWidth: 1)
                    )
                    .padding(.horizontal, 2)

                    // Top-right + button
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .background(Circle().fill(Color.blue))
                    }
                    .frame(width: 36, height: 36)
                    .offset(x: -10, y: -18)
                }

                Spacer().frame(height: 28)

                // REMINDERS SECTION
                HStack {
                    Text("Reminders")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                    Image(systemName: "plus.circle")
                        .foregroundColor(.blue)
                        .font(.title3)
                }
                .padding(.horizontal, 2)
                .padding(.bottom, 2)
                // Reminder card
                HStack(alignment: .center, spacing: 12) {
                    VStack {
                        Spacer()
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 12, height: 12)
                        Spacer()
                    }
                    .frame(height: 38)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Vet Appointment")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        Text("Due: Jan 15, 2026")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                        Text("Charlie")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    Spacer()
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(Color.black)
                        .shadow(color: Color(.black).opacity(0.10), radius: 6, x: 0, y: 2)
                )
                .padding(.horizontal, 2)

                Spacer().frame(height: 28)

                // NEARBY SECTION
                Text("Nearby")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 2)
                    .padding(.bottom, 2)
                VStack(spacing: 0) {
                    HStack {
                        Text("Parks")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.body)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 18)
                    .background(
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .fill(Color(.systemGray4))
                    )
                    .padding(.horizontal, 10)
                    Divider().padding(.horizontal, 16)
                    VStack(spacing: 0) {
                        HStack {
                            Text("Central Bark")
                                .font(.body)
                            Spacer()
                            Text("1.2 km")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 16)
                        HStack {
                            Text("Greenfield Park")
                                .font(.body)
                            Spacer()
                            Text("2.8 km")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 16)
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(Color.white)
                        .shadow(color: Color(.black).opacity(0.06), radius: 6, x: 0, y: 2)
                )
                .padding(.horizontal, 2)
                Spacer().frame(height: 8)
            }
            .padding(.horizontal, 20)
            .padding(.top, 0)
            .padding(.bottom, 20)
        }
        .background(Color(.systemGray6).ignoresSafeArea())
    }
}

#Preview {
    HomeView()
}
