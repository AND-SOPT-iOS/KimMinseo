//
//  FriendListView.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 12/12/24.
//

import SwiftUI

struct FriendListView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(1...10, id: \ .self) { index in
                    VStack {
                        Image("character_image3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .cornerRadius(25)
                        Text("친구 \(index)")
                            .font(.caption)
                            .fontWeight(.medium)
                    }
                }
            }
        }
    }
}


#Preview {
    FriendListView()
}
