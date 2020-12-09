//
//  BarView.swift
//  Student
//
//  Created by Артур Гайсин on 08.12.2020.
//  Copyright © 2020 Artur gaisin. All rights reserved.
//

import SwiftUI


struct BarView: View {
var value: CGFloat = 0
var week: String = ""
    @available(iOS 13.0.0, *)
    var body: some View {
VStack {
ZStack(alignment: .bottom) {
Capsule().frame(width: 30, height: value)
    .foregroundColor(Color(#colorLiteral(red: 0.6666070223, green: 0.6667048931, blue: 0.6665855646, alpha: 1)))
Capsule().frame(width: 30, height: value)
.foregroundColor(Color(.white))
Capsule().frame(width: 30, height: value)
.foregroundColor(Color(.white))
Capsule().frame(width: 20, height: value)
.foregroundColor(Color(.white))
Capsule().frame(width: 20, height: value)
.foregroundColor(Color(.white))
  }
Text(week)
    }
  }
}
struct BarView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
BarView()
  }
}
