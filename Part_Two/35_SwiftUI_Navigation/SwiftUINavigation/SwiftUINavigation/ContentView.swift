//
//  ContentView.swift
//  SwiftUIList
//
//  Created by 彭明健 on 2024/10/20.
//

import SwiftUI

struct ContentView: View {
    let chatItemModels: [ChatItemModel] = [
        ChatItemModel(id: 0, title: "美团技术团队", subTitle: "大前端：如何突破动态化容器的天花板？"),
        ChatItemModel(id: 1, title: "Apifox", subTitle: "Apifox「动态值」全新升级：灵活生成任意类型的数据"),
        ChatItemModel(id: 2, title: "美团饭票助手", subTitle: "拼手速，抢免单！神券节狂撒18元券"),
        ChatItemModel(id: 3, title: "广州慈惠医院", subTitle: "拼手速，抢免单！神券节狂撒18元券"),
        ChatItemModel(id: 4, title: "广州交警", subTitle: "广州交警接到群众举报“飙车炸街”......"),
        ChatItemModel(id: 5, title: "语雀", subTitle: "社区精选｜时间管理到底在管理什么"),
        ChatItemModel(id: 6, title: "央视新闻", subTitle: "校长被免职、多名干部停职！官方通报“学校食堂臭肉事件”"),
        ChatItemModel(id: 7, title: "黑马程序员", subTitle: "连续多期就业喜人，不愧是黑马镇校学科！"),

        ChatItemModel(id: 8, title: "美团技术团队", subTitle: "大前端：如何突破动态化容器的天花板？"),
        ChatItemModel(id: 9, title: "Apifox", subTitle: "Apifox「动态值」全新升级：灵活生成任意类型的数据"),
        ChatItemModel(id: 10, title: "美团饭票助手", subTitle: "拼手速，抢免单！神券节狂撒18元券"),
        ChatItemModel(id: 11, title: "广州慈惠医院", subTitle: "拼手速，抢免单！神券节狂撒18元券"),
        ChatItemModel(id: 12, title: "广州交警", subTitle: "广州交警接到群众举报“飙车炸街”......"),
        ChatItemModel(id: 13, title: "语雀", subTitle: "社区精选｜时间管理到底在管理什么"),
        ChatItemModel(id: 14, title: "央视新闻", subTitle: "校长被免职、多名干部停职！官方通报“学校食堂臭肉事件”"),
        ChatItemModel(id: 15, title: "黑马程序员", subTitle: "连续多期就业喜人，不愧是黑马镇校学科！")
    ]

    var body: some View {
        NavigationView {
            VStack {
                List(chatItemModels, id: \.id) { item in
                    NavigationLink(destination: ChatDetailView(chatItemModel: item)) {
                        ChatItemView(chatItemModel: item)
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

struct ChatItemView: View {
    var chatItemModel: ChatItemModel

    var body: some View {
        HStack(spacing: 10) {
            Image("girl")
                .resizable()
                .renderingMode(.original)
                .scaledToFill()
                .aspectRatio(1, contentMode: .fit)
                .clipShape(.rect(cornerRadius: 10))
            VStack(alignment: .leading, spacing: 2) {
                Text(chatItemModel.title)
                    .font(Font.system(size: 22))
                    .foregroundStyle(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
                    .lineLimit(1)
                Text(chatItemModel.subTitle)
                    .font(Font.system(size: 16))
                    .foregroundStyle(Color(red: 153 / 255, green: 153 / 255, blue: 153 / 255))
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .padding(10)
        .frame(height: 70)
        .listRowInsets(EdgeInsets())
    }
}

struct ChatItemModel {
    var id: Int64
    var title: String
    var subTitle: String
}

#Preview {
    ContentView()
}
