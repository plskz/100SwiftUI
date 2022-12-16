//  Date: 12/15/22
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct ContentView: View {
    @State private var isShowingScore = false
    @State private var isShowingGameOver = false
    
    @State private var shouldWin = Bool.random()
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var computerPick: Int = Int.random(in: 0...2)
    @State private var playerPick = -1
    
    @State private var currentRound = 1
    private let GAME_COUNT = 10
    
    private let choices = ["rock", "paper", "scissor"]
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color(red: 0.4, green: 0.1, blue: 0.4),
                        Color(red: 0.7, green: 0.252, blue: 0.25),
                    ]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Rock Paper Scissor")
                    .font(.largeTitle.bold())
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                Color(red: 0.7, green: 0.9, blue: 0.5),
                                Color(red: 0.525, green: 0.525, blue: 0.35),
                                Color(red: 0.255, green: 0.443, blue: 0.25),
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .padding(.bottom)
                
                ChoiceImage(of: choices[computerPick], 256)
                
                HStack(spacing: 0){
                    Text("How to ")
                    Text("\(shouldWin ? "win" : "lose") ")
                        .foregroundColor(shouldWin ? .green : .red)
                    Text("this round?")
                }
                .font(.title2.bold())
                .padding()
                
                HStack(spacing: 35){
                    ForEach(0..<3) { number in
                        Button {
                            choiceTapped(number)
                        } label: {
                            ChoiceImage(of: choices[number], 64)
                                .padding(10)
                                .background(.ultraThinMaterial)
                                .cornerRadius(15)
                        }
                    }
                }
                .padding()
                
                Spacer()
                
                Text("Round: \(currentRound)/\(GAME_COUNT)")
                    .font(.title.bold())
                
                Text("Score: \(score)")
                    .padding(.top, -10)
                    .font(.title2)
                
                Spacer()
            }
        }
        .alert("\(scoreTitle)!", isPresented: $isShowingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            if scoreTitle == "Draw" {
                Text("Nobody wins this round!")
            } else if scoreTitle == "Correct" {
                Text("You got the correct answer!")
                Text("Your score is \(score)")
            } else {
                Text("You got the wrong answer!")
                Text("Your score is \(score)")
            }
        }
        .alert("Game Over!", isPresented: $isShowingGameOver) {
            Button("Restart", action: restartGame)
        } message: {
            Text("Your final score is \(score) out of \(GAME_COUNT).")
        }
    }
    
    func moveResult(_ player: Int) -> String {
        if playerPick == computerPick { return "Draw" }
        
        if shouldWin {
            if (
                (playerPick == 2 && computerPick == 1) ||
                (playerPick == 1 && computerPick == 0) ||
                (playerPick == 0 && computerPick == 2)
            ) {
                return "Correct"
            } else {
                return "Wrong"
            }
        } else {
            if (
                (playerPick == 0 && computerPick == 1) ||
                (playerPick == 1 && computerPick == 2) ||
                (playerPick == 2 && computerPick == 0)
            ) {
                return "Correct"
            } else {
                return "Wrong"
            }
        }
    }
    
    func choiceTapped(_ number: Int) {
        playerPick = number
        
        scoreTitle = moveResult(playerPick)
        score = scoreTitle == "Draw" ? score : scoreTitle == "Correct" ? score + 1 : score - 1
        score = score < 0 ? 0 : score // to avoid negative score
        
        isShowingScore = true
    }
    
    func askQuestion() {
        if currentRound == GAME_COUNT {
            isShowingGameOver = true
        } else {
            currentRound += 1
            shouldWin.toggle()
            computerPick = Int.random(in: 0...2)
        }
    }
    
    func restartGame() {
        shouldWin = Bool.random()
        computerPick = Int.random(in: 0...2)
        
        score = 0
        currentRound = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
