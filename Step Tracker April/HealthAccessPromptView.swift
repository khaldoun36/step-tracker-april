//
//  HealthAccessPromptView.swift
//  Step Tracker April
//
//  Created by khaldoun alnuaimi on 4/17/25.
//

import SwiftUI

struct HealthAccessPromptView: View {
    var description: String = """
    This screen explains why HealthKit access is needed and how it benefits the user. It builds trust before showing the system permission prompt to improve opt-in rates and support a smoother onboarding experience.
    """
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Image(.iconAppleHealth)
                .resizable()
                .frame(width: 90, height: 90)
                .shadow(
                    color: Color.gray.opacity(0.1),
                    radius: 10,
                    x: 0,
                    y: 5
                )
            Text("Apple Health Integration")
                .font(.title2)
                .fontWeight(.bold)
            Text(description)
                .foregroundStyle(.secondary)
            Button("Connect to Apple Health") {}
                .buttonStyle(.borderedProminent)
                .tint(.pink)
                .padding(.top, 120)
        }
        .padding(.horizontal, 32)
    }
}

#Preview {
    HealthAccessPromptView()
}
