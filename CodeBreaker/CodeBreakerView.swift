//
//  CodeBreakerView.swift
//  CodeBreaker
//
//  Created by jatin foujdar on 30/11/25.
//

import SwiftUI

struct CodeBreakerView: View {
    //MARK: DATA OWNED BY ME
    @State private var game  = CodeBreaker(pegChoices: [.brown, .yellow, .red, .black])
    @State private var selection: Int = 0
    
    
    var body: some View {
        VStack{
            ScrollView{
                view(for: game.masterCode)
                view(for: game.guess)
                ForEach(game.attempts.indices.reversed(), id: \.self){ index in
                    view(for: game.attempts[index])
                }
            }
            pegChooser
        }
        .padding()
    }
    
    var pegChooser: some View{
        HStack{
            ForEach(game.pegChoices, id: \.self){peg in
                Button{
                    game.setGuessPeg(peg , at: selection)
                }label: {
                    PegView(peg: peg)
                }
            }
        }
    }
    
    var guessButton : some View{
        Button("Guess"){
            withAnimation{
                game.attemptGuess()
            }
        }
        .font(.system(size: 80))
        .minimumScaleFactor(0.1)
    }
    
    // printf("attempedGuess")
    func view(for code : Code) -> some View{
        HStack{
            ForEach(code.pegs.indices, id: \.self){ index in
                PegView(peg: code.pegs[index])
                
                    .background{
                        if selection == index && code.kind == .guess{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color.gray)
                        }
                    }
                    .onTapGesture {
                        if code.kind == .guess {
                           selection =  index
                        }
                    }
            }
            MatchMaker(matches: code.matches)
                .overlay{
                    if code.kind == .guess{
                        guessButton
                    }
                }
        }
    }
}



#Preview {
    CodeBreakerView()
}
