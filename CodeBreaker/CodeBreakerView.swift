//
//  CodeBreakerView.swift
//  CodeBreaker
//
//  Created by jatin foujdar on 30/11/25.
//

import SwiftUI

struct CodeBreakerView: View {
   @State var game  = CodeBreaker()
    
    var body: some View {
        VStack{
            ScrollView{
                view(for: game.masterCode)
                view(for: game.guess)
                ForEach(game.attempts.indices.reversed(), id: \.self){ index in
                    view(for: game.attempts[index])
                }
                }
            Button("Guess"){
                withAnimation{
                    game.attemptGuess()
                }
            }
        }
        .padding()
    }
    
    func view(for code : Code) -> some View{
        HStack{
            ForEach(code.pegs.indices, id: \.self){ index in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(code.pegs[index])
                    .onTapGesture {
                        if code.kind == .guess {
                            game.changeGuessPeg(at: index)
                        }
                    }
            }
            MatchMaker(matches:[.exact, .inexact, .nomatch, .exact])
        }
    }
}



#Preview {
    CodeBreakerView()
}
