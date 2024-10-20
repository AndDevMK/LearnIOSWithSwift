//
//  ContentView.swift
//  SwiftUIPathDraw
//
//  Created by 彭明健 on 2024/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            /*
                带渐变颜色填充的菱形、虚线描边的菱形
             */
            Text("带渐变颜色填充的菱形、虚线描边的菱形")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)
            HStack(spacing: 10) {
                DrawView1()
                DrawView2()
            }

            /*
                简单的图形变换与组合
             */
            Text("简单的图形变换与组合")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)
            ZStack {
                ForEach(0 ..< 10) { i in
                    DrawView3(angle: Angle(degrees: Double(36 * i))).opacity(0.3)
                }
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

/*
    菱形图形（带渐变颜色填充）
 */
struct DrawView1: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 90, y: 0))
            path.addLine(to: CGPoint(x: 40, y: 100))
            path.addLine(to: CGPoint(x: 90, y: 200))
            path.addLine(to: CGPoint(x: 140, y: 100))
        }
        .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.green, Color.blue]), startPoint: .top, endPoint: .bottom))
        .frame(maxHeight: 200)
        .background(.yellow)
    }
}

/*
    菱形图形（虚线描边）
 */
struct DrawView2: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 90, y: 0))
            path.addLine(to: CGPoint(x: 40, y: 100))
            path.addLine(to: CGPoint(x: 90, y: 200))
            path.addLine(to: CGPoint(x: 140, y: 100))
            path.addLine(to: CGPoint(x: 90, y: 0))
        }
        /*
             lineWidth：线条的宽度
             lineCap：线条端点的样式
                /*
                     butt：线条端点是平直的，不超出线条宽度
                     round：线条端点是圆形的，半径为线条宽度的一半
                     square：线条端点是方形的，但宽度与线条相同，长度为线条宽度的一半加上半个单位长度，超出线条末尾
                 */
             lineJoin：线条交叉点或两条线条相连接的角处的样式
                /*
                     miter：在连接处形成一个尖角，其长度是线条宽度的倍数，由miterLimit控制。
                     round：连接处是一个半圆形，半径为线条宽度的一半
                     bevel：连接处是一个直角的斜边
                 */
             miterLimit：当lineJoin为.miter时，miterLimit控制尖角的最大长度，以线条宽度的倍数表示。如果尖角的长度超过这个限制，则会回退到.bevel样式。在miterLimit: 2中，表示尖角的最大长度是线条宽度的两倍。
             dash：一个数组，定义了虚线的模式。数组中的每个数字表示线条或空白（无线条）的长度。例如，[15, 4]表示15个单位的实线，后面跟着4个单位的空白。
             dashPhase：虚线模式的起始偏移量。在绘制虚线时，dashPhase定义了模式开始的偏移，可以用来创建移动或滚动的效果。在dashPhase: 2中，表示虚线模式从第2个单位开始绘制。
         */
        // 定义了一个线条宽度为2个单位、端点为圆形、交叉点为尖角（限制为线条宽度的两倍）、使用[15个单位实线，4个单位空白]模式的虚线样式，且虚线模式从第2个单位开始绘制。
        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .miter, miterLimit: 2, dash: [15, 4], dashPhase: 2))
        .foregroundColor(Color.red)
        .frame(maxHeight: 200)
        .background(.yellow)
    }
}

/*
    简单的图形变换与组合
 */
struct DrawView3: View {
    var angle: Angle
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 50))
            path.addLine(to: CGPoint(x: 100, y: 150))
            path.addLine(to: CGPoint(x: 180, y: 250))
        }
        .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom))
        // 旋转中心是Path容器的中心点，因为没设置frame，所以它的大小与ZStack一致
        .rotationEffect(angle, anchor: .center)
    }
}

#Preview {
    ContentView()
}
