//
//  SliderViewRepresentation.swift
//  UIKitSUI
//
//  Created by Андрей Парчуков on 20.09.2022.
//

import SwiftUI

struct SliderRepresentation: UIViewRepresentable {
    
    @Binding private var value: Double
    private let thumbTintColor: Color
    private let step: Float
    private let minimumValue: Float
    private let maximumValue: Float
    
    init(value: Binding<Double>, thumbTintColor: Color, step: Float, minimumValue: Float = 0.0, maximumValue: Float = 100.0) {
        self._value = value
        self.thumbTintColor = thumbTintColor
        self.step = step
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
    }
    
    func makeCoordinator() -> Self.Coordinator {
        Coordinator(value: $value, step: step)
    }
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.thumbTintColor = UIColor(thumbTintColor)
        slider.minimumValue = minimumValue
        slider.maximumValue = maximumValue
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged), for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor(thumbTintColor)
    }
    
}

extension SliderRepresentation {
    
    class Coordinator: NSObject {
        @Binding private var value: Double
        private let step: Float
        
        init(value: Binding<Double>, step: Float) {
            self._value = value
            self.step = step
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            let rounded = round(sender.value / step) * step
            sender.value = rounded
            value = Double(rounded)
        }
    }
    
}

struct SliderViewRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        SliderRepresentation(value: .constant(12), thumbTintColor: .red, step: 1)
    }
}
