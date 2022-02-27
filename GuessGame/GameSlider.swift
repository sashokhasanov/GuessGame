//
//  GameSlider.swift
//  GuessGame
//
//  Created by Сашок on 27.02.2022.
//

import SwiftUI

struct GameSlider: UIViewRepresentable {

    @Binding var currentValue: Double
    let targetValue: Int
    let range: ClosedRange<Int>
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = Float(range.lowerBound)
        slider.maximumValue = Float(range.upperBound)
        slider.thumbTintColor = .red
        
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.sliderDidChangeValue),
                         for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.setValue(Float(currentValue), animated: true)
        
        let newColor = uiView.thumbTintColor?.withAlphaComponent(computeAlpha())
        uiView.thumbTintColor = newColor
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator($currentValue)
    }
    
    private func computeAlpha() -> CGFloat {
        let difference = abs(targetValue - lround(currentValue))
        return CGFloat(difference) / CGFloat(range.upperBound)
    }
}

extension GameSlider {
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(_ value: Binding<Double>) {
            self._currentValue = value
        }
        
        @objc func sliderDidChangeValue(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}

struct GameSlider_Previews: PreviewProvider {
    static var previews: some View {
        GameSlider(currentValue: .constant(50), targetValue: 100, range: 0...100)
    }
}
