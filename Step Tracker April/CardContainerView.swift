//
//  CardContainerView.swift
//  Step Tracker April
//
//  Created by khaldoun alnuaimi on 4/16/25. // Note: Year 2025 might be a typo?
//

import SwiftUI

struct CardContainerView: View {
    let iconName: String
    let title: String
    let subTitle: String

    var body: some View {
        // Main container for the card content
        VStack(alignment: .leading) { // Align content to the leading edge
            HStack { // Align items vertically at the top if needed
                // Content VStack (Label and Subtitle)
                VStack(alignment: .leading, spacing: 8) {
                    Label(title, systemImage: iconName)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.pink) // Keep pink style for the label

                    Text(subTitle)
                        .font(.caption)
                        .foregroundStyle(.secondary) // Apply secondary style to subtitle
                }

                Spacer() // Pushes the chevron to the far right

                // Conditionally display the chevron if onTap is provided

                Image(systemName: "chevron.right")
                    .foregroundStyle(.secondary) // Style the chevron consistently
                // Add padding if needed, e.g., .padding(.leading)
            }
            RoundedRectangle(cornerRadius: 22)
                .frame(maxWidth: .infinity)
                .frame(height: 150)
        }
        .frame(maxWidth: .infinity) // Ensure the VStack fills the available width
        .padding(24) // Internal padding within the card background
        .background(
            Color(.secondarySystemBackground) // Set the background color
        )
        // Use one corner radius for clipping the shape
        .clipShape(RoundedRectangle(cornerRadius: 22)) // Apply rounded corners to the background
        // .padding(.top, 16) // Optional: Adds space *above* this card if needed

        // Apply the tap gesture to the entire VStack (the card area)
        // The gesture is added unconditionally, but the action only runs if onTap is not nil
    }
}

#Preview {
    // Wrap previews in a container for better visualization
    VStack(spacing: 20) {
        CardContainerView(iconName: "figure.walk", title: "Steps", subTitle: "Avg: 10K Steps")
    }
    .padding() // Add padding around the preview content
}
