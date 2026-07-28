//
//  ContentView.swift
//  War Card Game
//
//  Created by Shubham on 28/07/26.
//

import SwiftUI

struct ContentView: View {
    // @State tells SwiftUI to refresh the screen whenever these values change.
    // These strings match image names inside Assets.xcassets, like "card11" and "card9".
    @State var playerCard="card11"
    @State var cpuCard="card9"
    
    // These store the current scores for both players.
    @State var playerScore=0
    @State var cpuScore=0
    
    var body: some View {
        // ZStack places views on top of each other. The background image stays behind the game UI.
        ZStack{
            Image("background-plain")
            
            // VStack arranges logo, cards, button, and score section vertically.
            VStack(spacing:50) {
                Image("logo")
                
                // HStack arranges the player card and CPU card side by side.
                HStack (spacing:50){
                    Image(playerCard)
                    //Spacer()
                    Image(cpuCard)
                }
                
                // Button runs dealCards() when tapped. The button itself is shown using an image asset.
                //Image("button")
                Button{
                    dealCards()
                }
                label:{
                    Image("button")
                }
                
                // Score section: two vertical groups inside one horizontal row.
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom)
                        
                        // String(playerScore) converts the Int score into text for display.
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom)
                        
                        // String(cpuScore) converts the Int score into text for display.
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundStyle(.white)
            }
            .padding()
        }
    }
    
    func dealCards(){
        // Pick random card values from 2 to 14. Usually 11-14 represent Jack, Queen, King, Ace.
        let playerValue = Int.random(in: 2...14)
        let cpuValue = Int.random(in: 2...14)
        
        // Build the image names dynamically, for example "card" + "11" becomes "card11".
        playerCard = "card"+String(playerValue)
        cpuCard="card"+String(cpuValue)
        
        // Compare card values and increase the score for the higher card.
        if playerValue > cpuValue{
            playerScore += 1
        }else if playerValue < cpuValue{
            cpuScore += 1
        }
        else
        {
            // If both cards have the same value, both scores increase.
            playerScore += 1
            cpuScore += 1
            
        }
        
        
    }
}

#Preview {
    // Shows this view in Xcode's preview canvas.
    ContentView()
}
