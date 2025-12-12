//
//  ContentView.swift
//  CodeBreaker
//
//  Created by jatin foujdar on 30/11/25.
//

import SwiftUI

struct CodeBreakerView: View {
    let game : CodeBreaker = CodeBreaker()
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
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(colors[index])
            }
            MatchMaker(matches:[.exact, .inexact, .nomatch, .exact])
        }
    }
}



#Preview {
    CodeBreakerView()
}
