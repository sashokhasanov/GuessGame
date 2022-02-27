//
//  ContentView.swift
//  GuessGame
//
//  Created by Сашок on 27.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    let range = 0...100
    
    @State private var targetValue: Int
    @State private var currentValue: Double
    @State private var showResults = false
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Подвиньте слайдер как можно ближе к \(targetValue)")
            GameSliderView(currentValue: $currentValue, targetValue: targetValue, range: range)
            VStack(spacing: 20) {
                Button("Проверь меня", action: { showResults.toggle() })
                    .alert("Результат \(computeScore())", isPresented: $showResults, actions: {})
                Button("Начать заново", action: restartGame)
            }
        }
        .padding()
    }
    
    init() {
        targetValue = Int.random(in: range)
        currentValue = Double(range.lowerBound + range.upperBound) / 2
    }
    
    private func restartGame() {
        targetValue = Int.random(in: range)
        currentValue = Double(range.lowerBound + range.upperBound) / 2
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return range.upperBound - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
