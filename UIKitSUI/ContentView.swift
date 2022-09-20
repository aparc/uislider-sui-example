//
//  ContentView.swift
//  UIKitSUI
//
//  Created by Андрей Парчуков on 20.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 0.0
    
    @State private var resultPresented = false
    
    var sliderTintColor: Color {
        .red.opacity(Double(computeScore()) / 100.0)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            SliderView(
                value: $currentValue,
                tintColor: sliderTintColor,
                step: 1.0
            )
            
            Button("Проверь меня!") {
                resultPresented.toggle()
            }
            .alert(isPresented: $resultPresented) {
                Alert(
                    title: Text("Your Score"),
                    message: Text("\(computeScore())")
                )
            }
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
