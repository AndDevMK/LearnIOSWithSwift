//
//  ChatDetailView.swift
//  SwiftUINavigation
//
//  Created by 彭明健 on 2024/10/20.
//

import SwiftUI

struct ChatDetailView: View {
    var chatItemModel: ChatItemModel

    var body: some View {
        VStack(spacing: 20) {
            Image("girl")
                .resizable()
                .renderingMode(.original)
                .scaledToFill()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 200)
                .clipShape(.circle)
            Text(chatItemModel.title)
                .font(Font.system(size: 22))
                .foregroundStyle(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
                .lineLimit(1)
            Text(chatItemModel.subTitle)
                .font(Font.system(size: 16))
                .foregroundStyle(Color(red: 153 / 255, green: 153 / 255, blue: 153 / 255))
                .lineLimit(1)
                .padding(.horizontal, 20)
        }
    }
}

#Preview {
    ChatDetailView(chatItemModel: ChatItemModel(id: 0, title: "美团技术团队", subTitle: "大前端：如何突破动态化容器的天花板？"))
}
