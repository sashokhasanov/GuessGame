//
//  GameSliderView.swift
//  GuessGame
//
//  Created by Сашок on 27.02.2022.
//

import SwiftUI

struct GameSliderView: View {
    
    @Binding var currentValue: Double
    var targetValue: Int
    let range: ClosedRange<Int>
    
    var body: some View {
        HStack(spacing: 20) {
            Text("\(range.lowerBound)")
            GameSlider(currentValue: $currentValue, targetValue: targetValue, range: range)
            Text("\(range.upperBound)")
        }
    }
}

struct GameSliderView_Previews: PreviewProvider {
    static var previews: some View {
        GameSliderView(currentValue: .constant(50), targetValue: 100, range: 0...100)
    }
}
