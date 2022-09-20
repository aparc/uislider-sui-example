//
//  SliderView.swift
//  UIKitSUI
//
//  Created by Андрей Парчуков on 20.09.2022.
//

import SwiftUI

struct SliderView: View {
    
    @Binding private var value: Double
    private let tintColor: Color
    private let step: Float
    private let minimumValue: Float
    private let maximumValue: Float
    
    init(value: Binding<Double>, tintColor: Color, step: Float, minimumValue: Float = 0.0, maximumValue: Float = 100.0) {
        self._value = value
        self.tintColor = tintColor
        self.step = step
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
    }
    
    var body: some View {
        HStack {
            Text(minimumValue.formatted())
            SliderRepresentation(
                value: $value,
                thumbTintColor: tintColor,
                step: step,
                minimumValue: minimumValue,
                maximumValue: maximumValue
            )
            Text(maximumValue.formatted())
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(12), tintColor: .red, step: 1)
    }
}
