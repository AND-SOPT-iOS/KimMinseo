//
//  TodoListView.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 12/12/24.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var viewModel: TodoViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    print("개인 할 일 버튼 클릭됨")
                }) {
                    HStack {
                        Text("개인 할 일")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.todoBrown)
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.lightgray)
                    .cornerRadius(50)
                }
            }
            .padding(.bottom, 10)
            
            ForEach(viewModel.todos.indices, id: \.self) { index in
                HStack(alignment: .top) {
                    Button(action: {
                        viewModel.toggleTodoCheck(at: index)
                        viewModel.reorderTodos()
                    }) {
                        ZStack {
                            Image("todo_none")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 25, height: 25)
                                .foregroundColor(viewModel.todos[index].isChecked ? .todoBrown : .todoGray)
                            if viewModel.todos[index].isChecked {
                                Image("check")
                                    .resizable()
                                    .frame(width: 15, height: 11)
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.todos[index].text)
                            .font(.body)
                            .foregroundColor(.primary)
                        
                        if let time = viewModel.todos[index].time {
                            HStack {
                                Image(systemName: "clock")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text(time)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    Spacer()
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 5)
            }
        }
    }
}