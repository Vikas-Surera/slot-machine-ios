//
//  ContentView.swift
//  slotmachine
//
//  Created by Vikas Surera on 09/07/22.
//

import SwiftUI

struct ContentView: View {
    private var options = ["apple", "cherry","star"]
    
    @State private var slot1 = "star"
    @State private var slot2 = "star"
    @State private var slot3 = "star"
    
    @State private var credits = 1000
    
    var body: some View {
        VStack{
            Text("SwiftUI Slots!").font(.largeTitle).padding(.top, 30.0)
            
            Spacer()
            
            Text("Credits: "+String(credits))
            
            Spacer()
            
            HStack{
                Image(slot1).resizable().aspectRatio(contentMode: .fit)
                Image(slot2).resizable().aspectRatio(contentMode: .fit)
                Image(slot3).resizable().aspectRatio(contentMode: .fit)
            }
            
            Spacer()
            
            Button("Spin"){
                // deduct 25
                // add 200
                
                let rand1 = Int.random(in: 0...2)
                let rand2 = Int.random(in: 0...2)
                let rand3 = Int.random(in: 0...2)
                
                slot1=options[rand1]
                slot2=options[rand2]
                slot3=options[rand3]
                
                if (rand1==rand2) && (rand2==rand3){
                    credits+=200
                }else{
                    credits-=25
                }
                
            }.padding(EdgeInsets(top: 12, leading: 35, bottom: 12, trailing: 35))
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(24)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}
