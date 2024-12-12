//
//  WeekdayHeaderView.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 12/12/24.
//

import SwiftUI

struct MonthSelectorView: View {
    var body: some View {
        HStack {
            Text("2024년 11월")
                .font(.subheadline)
                .fontWeight(.bold)
            Spacer()
            Image(systemName: "chevron.left")
            Image(systemName: "chevron.right")
        }
    }
}

#Preview {
    MonthSelectorView()
}
