//
//  ContentView.swift
//  SwiftUIState
//
//  Created by 彭明健 on 2024/10/20.
//

import SwiftUI

struct ContentView: View {
    @State private var count1: Int = 0
    @State private var count2: Int = 0
    @State private var myData: MyData = .init()

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            /*
                1、单个组件内部的状态管理
             */
            Text("1、单个组件内部的状态管理：")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)
            Button(action: {
                count1 += 1
            }) {
                Text("add 1 for count1")
                    .font(Font.system(size: 20))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: 200, height: 50)
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))

            Text("count1: \(count1)")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)

            /*
                2、父子通信之双向绑定
             */
            Text("2、父子通信之双向绑定：")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)
            Text("父View")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)
            Button(action: {
                count2 += 1
            }) {
                Text("add 1 for count2")
                    .font(Font.system(size: 20))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: 200, height: 50)
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))

            Text("count2: \(count2)")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)

            ChildView1(count2: $count2)

            /*
                3 、使用环境对象跨级传递数据
             */
            Text("3、使用环境对象跨级传递数据：")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)
            Text("父View")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)
            Button(action: {
                myData.count += 1
            }) {
                Text("add 1 for count3")
                    .font(Font.system(size: 20))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: 200, height: 50)
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
            ChildView2().environmentObject(myData)
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

/*
    2、父子通信之双向绑定
 */
struct ChildView1: View {
    @Binding var count2: Int

    var body: some View {
        VStack(alignment: .leading) {
            Text("子View")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)

            Button(action: {
                count2 += 1
            }) {
                Text("add 1 for count2")
                    .font(Font.system(size: 20))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: 200, height: 50)
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))

            Text("count2: \(count2)")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: 150, alignment: .topLeading)
        .background(.gray)
    }
}

/*
    3 、使用环境对象跨级传递数据
 */
class MyData: ObservableObject {
    @Published var count: Int = 0
}

struct ChildView2: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("子View")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)
            ChildView3()
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: 250, alignment: .topLeading)
        .background(.gray)
    }
}

struct ChildView3: View {
    @EnvironmentObject var myData: MyData

    var body: some View {
        VStack(alignment: .leading) {
            Text("子View")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)

            Button(action: {
                myData.count += 1
            }) {
                Text("add 1 for count3")
                    .font(Font.system(size: 20))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: 200, height: 50)
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
            Text("count3: \(myData.count)")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.red)
    }
}

#Preview {
    ContentView()
}
