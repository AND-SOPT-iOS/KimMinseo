//
//  TodoMateView.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 12/12/24.
//

import SwiftUI

struct TodoMateView: View {
    let days = Array(1...30)
    let weekDays = ["월", "화", "수", "목", "금", "토", "일"]
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    let todos = [
        (text: "힙콘 연말 파티 장소 찾아보기", isChecked: false, time: nil),
        (text: "스유 스터디 회식 투표 올리기", isChecked: false, time: nil),
        (text: "모각작 in 강남", isChecked: true, time: "PM 2:00"),
        (text: "기획 경선 자료 확인하기", isChecked: true, time: nil)
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                FriendListView()
                    .padding(.bottom, 30)
                
                UserInfoView()
                    .padding(.bottom, 20)
                
                MonthSelectorView()
                    .padding(.bottom, 20)
                
                CalendarView(weekDays: weekDays, days: days, columns: columns)
                    .padding(.bottom, 20)
                
                TodoListView(todos: todos)
                    .padding(.top, 10)
                
                Spacer()
            }
            .padding()
        }
    }
    
}



#Preview {
    TodoMateView()
}
