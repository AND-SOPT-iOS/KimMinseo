//
//  AppStoreView.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/29/24.
//

import SwiftUI

struct AppStoreView: View {
    
    let imageNames = ["sopt_preview_1", "sopt_preview_2", "sopt_preview_3", "sopt_preview_4"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 16) {
                    Image("sopt_app_icon") // 커스텀 앱 아이콘
                        .resizable()
                        .frame(width: 110, height: 110)
                        .cornerRadius(20)
                    VStack(alignment: .leading) {
                        Text("솝트 SOPT-IT 벤처 창업 동아리 공식앱")
                            .font(.system(size: 19, weight: .semibold))
                            .bold()
                        Text("기획자, 디자이너, 개발자가 협업하며 성장하는 SOPT")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(.gray)
                            .lineLimit(1)
                            .truncationMode(.tail)
                        Spacer()
                        HStack {
                            Button(action: {
                                print("열기 버튼 클릭됨!")
                            }) {
                                Text("열기")
                                    .font(.system(size: 13, weight: .bold))
                                    .frame(width: 65, height: 30)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            }
                            Spacer()
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .frame(width: 17, height: 22)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    Spacer()
        
                }
                .padding(.horizontal)
                
                Divider()
                
                // 별점과 기타 정보
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 30) { // spacing 값을 적절히 조정
                        VStack(spacing: 6) {
                            Text("연령")
                                .font(.system(size: 9, weight: .regular))
                                .foregroundColor(.gray)
                            Text("17+")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.gray)
                            Text("세")
                                .font(.system(size: 9, weight: .regular))
                                .foregroundColor(.gray)
                        }

                        Divider()
                            .frame(height: 40)

                        VStack(spacing: 6) {
                            Text("카테고리")
                                .font(.system(size: 9, weight: .regular))
                                .foregroundColor(.gray)
                            Image(systemName: "ellipsis.message.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray)
                            Text("소셜 네트워킹")
                                .font(.system(size: 9, weight: .regular))
                                .foregroundColor(.gray)
                        }

                        Divider()
                            .frame(height: 40)

                        VStack(spacing: 6) {
                            Text("개발자")
                                .font(.system(size: 9, weight: .regular))
                                .foregroundColor(.gray)
                            Image(systemName: "person.crop.square")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray)
                            Text("Donggyu Jung")
                                .font(.system(size: 9, weight: .regular))
                                .foregroundColor(.gray)
                        }

                        Divider()
                            .frame(height: 40)

                        VStack(spacing: 6) {
                            Text("언어")
                                .font(.system(size: 9, weight: .regular))
                                .foregroundColor(.gray)
                            Text("KO")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.gray)
                            Text("한국어")
                                .font(.system(size: 9, weight: .regular))
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal)

                    .padding(.horizontal)
                }
                
                
                Divider()
                
                // 새로운 소식
                VStack(alignment: .leading, spacing: 8) {
                    Text("새로운 소식")
                        .font(.system(size: 19, weight: .semibold))
                        .bold()
                    HStack {
                        Text("버전 2.6.2")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("3주 전")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(.gray)
                    }

                }
                .padding(.horizontal)
                
                // 미리 보기 이미지
                VStack(alignment: .leading) {
                    Text("미리 보기")
                        .font(.system(size: 19, weight: .semibold))
                        .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(imageNames, id: \.self) { imageName in
                                Image(imageName) // 시스템 아이콘
                                    .resizable()
                                    .frame(width: 200, height: 400)
                                    .cornerRadius(10)
                                    .shadow(radius: 2)
                            }
                        }
                        
                        .padding(.horizontal)
                    }
                    
                    Divider()

                    Text("SHOUT OUT PASSION TOGETHER, 솝트 활동을 더욱 알차고 즐겁게!\nSOPT는 IT와 벤처 창업에 뜻이 있는 대학생들이 모인 국내")
                        .font(.system(size: 15, weight: .regular))
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
    }
}
    


#Preview {
    AppStoreView()
}
