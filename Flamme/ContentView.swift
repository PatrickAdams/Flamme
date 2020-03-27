//
//  ContentView.swift
//  Flamme
//
//  Created by Patrick Adams on 3/27/20.
//  Copyright © 2020 Patrick Adams. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var sprinteurSelections = [Int]()
    @State var rouleurSelections = [Int]()

    @State var sprinteurCards = [2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 9, 9, 9]
    @State var rouleurCards = [3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 7]

    @State var sprinteurCardsThatNeedShuffled = []
    @State var rouleurCardsThatNeedShuffled = []

    var body: some View {
        VStack {
            VStack {
                HStack {
                    ForEach(sprinteurSelections, id: \.self) { card in
                        Button(action: {
                            if let indexToRemove = self.sprinteurCards.firstIndex(of: card) {
                                self.sprinteurCards.remove(at: indexToRemove)
                                print(self.sprinteurCards)
                            } else {
                                print("Card not found")
                            }
                        }) {
                            Text("\(card)")
                                .fontWeight(.bold)
                                .font(.system(size: 24))
                                .foregroundColor(.green)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5).stroke(Color.green, lineWidth: 2))
                        }
                    }
                }
                    .frame(height: 100)
                Spacer()
                    .frame(height: 20)
                Button(action: {
                    self.shuffleAndPickSprinteurCards()
                }) {
                    Text("Shuffle Sprinteur Cards")
                }
            }
            Spacer()
                .frame(height: 50)
            VStack {
                HStack {
                    ForEach(rouleurSelections, id: \.self) { card in
                        Button(action: {
                            if let indexToRemove = self.rouleurCards.firstIndex(of: card) {
                                self.rouleurCards.remove(at: indexToRemove)
                                print(self.rouleurCards)
                            } else {
                                print("Card not found")
                            }
                        }) {
                            Text("\(card)")
                                .fontWeight(.bold)
                                .font(.system(size: 24))
                                .foregroundColor(.green)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5).stroke(Color.green, lineWidth: 2))
                        }
                    }
                }
                    .frame(height: 100)
                Spacer()
                    .frame(height: 20)
                Button(action: {
                    self.shuffleAndPickRouleurCards()
                }) {
                    Text("Shuffle Rouleur Cards")
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }

    func shuffleAndPickSprinteurCards() {
        let selectedCards = sprinteurCards.choose(sprinteurCards.count > 3 ? 4 : sprinteurCards.count)
        print(selectedCards)
        sprinteurSelections = Array(selectedCards)
        print(sprinteurCards)
    }

    func shuffleAndPickRouleurCards() {
        let selectedCards = rouleurCards.choose(rouleurCards.count > 3 ? 4 : rouleurCards.count)
        print(selectedCards)
        rouleurSelections = Array(selectedCards)
        print(rouleurCards)
    }
}

extension Collection {
    func choose(_ n: Int) -> ArraySlice<Element> { shuffled().prefix(n) }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
