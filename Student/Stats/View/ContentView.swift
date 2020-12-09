//
//  SwiftUIView.swift
//  Student
//
//  Created by Артур Гайсин on 08.12.2020.
//  Copyright © 2020 Artur gaisin. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct ContentView: View {
@State private var pickerSelectedItem = 0
@State private var dataPoints: [[CGFloat]] = [
[100, 120, 150],
[150, 100, 120],
[120, 150, 100],
[120, 100, 150],
[130, 50, 100]
]
    @available(iOS 13.0.0, *)
    var body: some View {
ZStack {
Color(.orange).edgesIgnoringSafeArea(.all)
VStack {
Text("BAR CHART")
.font(.system(size: 28))
.fontWeight(.medium)
.foregroundColor(Color(.white))
Picker(selection: $pickerSelectedItem, label: Text("")) {
Text("Weekly").tag(0)
Text("Monthly").tag(1)
Text("Yearly").tag(2)
Text("Leap Year").tag(3)
Text("Weekend").tag(4)
}.pickerStyle(SegmentedPickerStyle())
.padding(.horizontal, 24)
HStack(spacing: 8) {
BarView(value: dataPoints[pickerSelectedItem][0], week: "D")
BarView(value: dataPoints[pickerSelectedItem][1], week: "D")
BarView(value: dataPoints[pickerSelectedItem][2], week: "D")
BarView(value: dataPoints[pickerSelectedItem][2], week: "D")
BarView(value: dataPoints[pickerSelectedItem][2], week: "D")
}.padding(.top, 24)
.animation(.default)
       }
     }
  }
}
struct ContentView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
ContentView()
  }
}
