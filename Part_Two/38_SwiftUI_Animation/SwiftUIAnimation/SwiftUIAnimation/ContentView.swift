//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by 彭明健 on 2024/10/20.
//

import SwiftUI

struct ContentView: View {
    @State private var beginPropertyAnim: Bool = false
    @State private var beginTransitionAnim: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            /*
                属性动画
             */
            Text("属性动画")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)
            Button(action: {
                beginPropertyAnim.toggle()
            }) {
                Text("开始动画")
                    .font(Font.system(size: 20))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
            .frame(width: 150, height: 50)
            .background(.blue)
            .rotationEffect(.degrees(beginPropertyAnim ? 180 : 0), anchor: .center)
            .scaleEffect(beginPropertyAnim ? 2 : 1, anchor: .zero)
            .animation(.easeIn(duration: 2))

            /*
                转场动画
             */
            Text("转场动画")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)
            Button(action: {
                withAnimation {
                    beginTransitionAnim.toggle()
                }

            }) {
                Text("开始动画")
                    .font(Font.system(size: 20))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
            .frame(width: 150, height: 50)
            .background(.blue)
            .rotationEffect(.degrees(beginTransitionAnim ? 180 : 0), anchor: .center)
            .scaleEffect(beginTransitionAnim ? 2 : 1, anchor: .zero)
            .animation(.easeIn(duration: 2))

            if self.beginTransitionAnim {
                VStack {}
                    .frame(width: 200, height: 200, alignment: .leading)
                    .background(.red)
                    .animation(.customSpring())
                    .transition(.offset(x: -300, y: 0))
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

extension Animation {
    static func customSpring() -> Animation {
        /*
             response: 响应系数（也称为刚度系数）。它决定了弹簧的“硬度”或“刚度”。值越大，弹簧感觉越“硬”，动画完成得越快。在这个例子中，1.5的响应系数意味着弹簧动画将比默认弹簧动画更快达到其目标值。
             dampingFraction: 阻尼系数。它决定了弹簧动画在达到目标值之前的振荡次数。值范围从0到1，其中0表示无阻尼（弹簧将无限振荡），1表示完全阻尼（弹簧不会振荡，将平滑地达到目标值）。在这个例子中，0.5的阻尼系数意味着弹簧动画会有一定程度的振荡，但不会太多。
             blendDuration: 混合持续时间。它定义了动画开始和结束时与其他动画混合的持续时间，这有助于创建平滑的过渡。在这个例子中，0.5秒的混合持续时间意味着动画的开始和结束阶段将各持续0.5秒，与其他动画平滑混合。
         */
        Animation.spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.2)
            // speed: 这将动画的速度设置为默认速度的2倍。这意味着动画将以更快的速度完成。
            .speed(3)
            // delay: 这为动画的开始添加了0.03秒的延迟。在动画开始执行之前，将会有0.03秒的暂停
            .delay(0.03)
    }
}

#Preview {
    ContentView()
}
