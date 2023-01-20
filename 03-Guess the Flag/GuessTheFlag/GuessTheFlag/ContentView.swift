//  Date: 12/7/22
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

// project 3 - challenge 2
struct FlagImage: View {
    var country: String
    
    init(of country: String) {
        self.country = country
    }
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var isShowingScore = false
    @State private var isShowingGameOver = false
    
    @State private var countries = [
        "Estonia", "France", "Germany",
        "Ireland", "Italy", "Monaco",
        "Nigeria", "Poland", "Russia",
        "Spain", "UK", "US"
    ].shuffled()
    
    @State private var score = 0
    @State private var scoreTitle = ""
    
    @State private var currentRound = 1
    @State private var selectedAnswer = ""
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var rotateAmount = [0.0, 0.0, 0.0]  // project 6 - challenge 1
    @State private var opacityAmount = [1.0, 1.0, 1.0] // project 6 - challenge 2
    @State private var scaleAmount = [1.0, 1.0, 1.0]   // project 6 - challenge 3
    
    let GAME_COUNT = 8
    
    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                ],
                center: .top,
                startRadius: 200,
                endRadius: 400
            )
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess The Flag")
                    .foregroundColor(.white)
                    .font(.largeTitle.bold())
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(of: countries[number]) // project 3 - challenge 2
                        }
                        .rotation3DEffect(Angle(degrees: rotateAmount[number]), axis: (x: 0, y: 1, z: 0)) // project 6 - challenge 1
                        .opacity(opacityAmount[number])     // project 6 - challenge 2
                        .scaleEffect(scaleAmount[number])   // project 6 - challenge 3
                        .animation(.default, value: scaleAmount)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Text("Round: \(currentRound)")
                    .foregroundColor(.white)
                    .font(.title2)
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $isShowingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            if scoreTitle == "Correct!" {
                Text("You got the correct answer!")
                Text("Your score is \(score)")
            } else {
                Text("That's the flag for \(selectedAnswer)") // challenge 2
                Text("Your score is \(score)")
            }
        }
        .alert("Game Over!", isPresented: $isShowingGameOver) {
            Button("Restart", action: restartGame)
        } message: {
            Text("Your final score is \(score) out of \(GAME_COUNT).") // challenge 3
        }
    }
    
    func flagTapped(_ number: Int) {
        selectedAnswer = countries[number]
        
        // project 6 - challenge 1
        rotateAmount[number] += 360
        
        // project 6 - challenge 2 and 3
        for notTapped in 0..<3 where notTapped != number {
            opacityAmount[notTapped] = 0.25
            scaleAmount[notTapped] = 0.85
        }
        
        scoreTitle = number == correctAnswer ? "Correct!" : "Wrong!" // challenge 1
        score = number == correctAnswer ? score + 1 : score
        
        isShowingScore = true
    }
    
    func askQuestion() {
        if currentRound == GAME_COUNT {
            isShowingGameOver = true
        } else {
            currentRound += 1
            
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            
            opacityAmount = [1.0, 1.0, 1.0]
            scaleAmount = [1.0, 1.0, 1.0]
        }
    }
    
    func restartGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        opacityAmount = [1.0, 1.0, 1.0]
        scaleAmount = [1.0, 1.0, 1.0]
        
        score = 0
        currentRound = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
