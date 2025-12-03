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
            ForEach(colors.indices, id: \.self){ index in
                Circle().foregroundStyle(colors[index])
            }
        }
    }
}

#Preview {
    ContentView()
}
