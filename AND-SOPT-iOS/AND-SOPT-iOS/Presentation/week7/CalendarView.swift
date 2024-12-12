//
//  CalendarView.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 12/12/24.
//

import SwiftUI

struct CalendarView: View {
    let weekDays: [String]
    let days: [Int]
    let columns: [GridItem]

    var body: some View {
        VStack {
            HStack {
                ForEach(weekDays, id: \ .self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(day == "토" ? .blue : day == "일" ? .red : .primary)
                        .font(.caption)
                        .fontWeight(.medium)
                }
            }
            .padding(.bottom, 10)

            LazyVGrid(columns: columns) {
                ForEach(days, id: \ .self) { day in
                    CalendarDayView(day: day)
                        .padding(.bottom, 10)
                }
            }
        }
    }
}

struct CalendarDayView: View {
    let day: Int

    var body: some View {
        VStack {
            ZStack {
                if day <= 15 {
                    Image("todo_checked")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Image("check")
                        .resizable()
                        .frame(width: 15, height: 11)
                } else {
                    Image("todo_none")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text("2")
                        .foregroundColor(.white)
                        .font(.caption)
                        .fontWeight(.bold)
                }
            }

            Text("\(day)")
                .foregroundColor(.primary)
                .font(.caption2)
                .fontWeight(.medium)
        }
    }
}
