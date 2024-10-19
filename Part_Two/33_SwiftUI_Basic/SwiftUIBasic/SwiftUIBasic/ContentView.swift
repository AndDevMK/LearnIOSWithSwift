//
//  ContentView.swift
//  SwiftUIBasic
//
//  Created by 彭明健 on 2024/10/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("girl")
                .resizable()
                .renderingMode(.original)
                .scaledToFill()
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(.circle)
                .shadow(color: .gray, radius: 20, x: 5, y: 5)
            Text("Hello, world!")
                .font(Font.system(size: 30))
                .foregroundColor(.blue)
                .background(.yellow)
                .padding(.top, 60)
            Spacer()
            Label(text: "Use UILabel in SwiftUI")
                .frame(height: 60)
                .background(.pink)
                .padding(.bottom, 100)
        }
        .padding(20)
    }
}

/*
    在SwiftUI中使用UIKit中的组件
 */
struct Label: UIViewRepresentable {
    var text: String

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
    }

    typealias UIViewType = UILabel
}

#Preview {
    ContentView()
}
