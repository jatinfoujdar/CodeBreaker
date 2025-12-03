//
//  ContentView.swift
//  CodeBreaker
//
//  Created by jatin foujdar on 30/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            pegs(colors: [.red, .green, .blue, .yellow])
            pegs(colors: [.red, .yellow, .blue, .blue])
            pegs(colors: [.blue, .green, .red, .yellow])
        }
        .padding()
    }
    
   func pegs(colors: [Color]) -> some View{
        HStack{
            Circle().foregroundStyle(colors[0])
            Circle().foregroundStyle(colors[1])
            Circle().foregroundStyle(colors[2])
            Circle().foregroundStyle(colors[3])
        }
    }
}

#Preview {
    ContentView()
}
