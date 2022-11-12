//
//  InitialLettersView.swift
//  toDus-SwiftUI
//
//  Created by Wilder Lopez on 8/26/20.
//  Copyright © 2020 iGhost. All rights reserved.
//

import SwiftUI

struct InitialLettersView: View {
    
    @State var size : CGFloat
    @State var letter : String
    
    var rRed    = Double.random(in: 0...1)
    var rBlue   = Double.random(in: 0...1)
    var rGreen  = Double.random(in: 0...1)
    var rAlpha  = Double.random(in: 0...1)
    
    var isDark : Bool {
        let lum = 0.2126 * rRed + 0.7152 * rGreen + 0.0722 * rBlue
        return lum < 0.5
    }
    var body: some View {
        ZStack {
            Circle()
                .frame(width: size, height: size, alignment: .center)
                .foregroundColor(getBackColor(rRed: rRed, rGreen: rGreen, rBlue: rBlue, alpha: rAlpha))
                .overlay {
                    Text("\(InitialsForLetters(letter: letter))")
                        .font(.system(size: size/2, weight: .bold, design: .rounded))
                        .foregroundColor( isDark ? .white : .black)
                }
        }
    }
}

struct InitialLettersView_Previews: PreviewProvider {
    static var sameSize : CGFloat = 60
    static var previews: some View {
        InitialLettersView(size: sameSize, letter: "Wilder Lopez")
    }
}

extension InitialLettersView {
    
    func InitialsForLetters(letter : String) -> String {
        let split = letter.split(separator: Character(" "))
        return split.count > 1 ? "\(split[0].prefix(1))\(split[1].prefix(1))" : "\(split[0].prefix(1))" + "".uppercased()
    }
    func getBackColor(rRed: Double, rGreen : Double, rBlue: Double, alpha: Double) -> Color {
        return Color(red: rRed, green: rGreen, blue: rBlue)
    }
}
