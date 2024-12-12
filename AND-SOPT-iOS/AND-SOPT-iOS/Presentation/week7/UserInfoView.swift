//
//  UserInfoView.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 12/12/24.
//

import SwiftUI

struct UserInfoView: View {
    var body: some View {
        HStack {
            Image("character_image2")
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(30)
            VStack(alignment: .leading) {
                Text("민서공이")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text("도파민 중독녀")
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            .padding(.leading, 5)
            Spacer()
        }
    }
}

#Preview {
    UserInfoView()
}
