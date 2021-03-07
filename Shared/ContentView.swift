//
//  ContentView.swift
//  Shared
//
//  Created by Erik Mikac on 3/7/21.
//DAY 32 of Hacking with swift
//https://www.hackingwithswift.com/100/swiftui/32

import SwiftUI

struct ContentView: View {
    /*
     The simplest type of animation is implicit animation.
     
     * A CGFloat is a double under a different name. It allowed Apple not to care which hardware it was working on.
     But everyting uses float now so it doesn't really matter.
     */
    @State private var animationAmount: CGFloat = 1
    var body: some View {
        Button("Tap Me") {
             self.animationAmount += 1
        }
        .padding(40)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        /*/
         We're create a a circle shaped btn.
         Then we are *overlaying* an animatin on top of it.
         Before, we were animating the button itself.
         The overlay keyword is the key here.
         */
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeOut(duration: 5)
                        .repeatForever(autoreverses: true)
                )
        )
        .onAppear {
            self.animationAmount = 2
        }
        
        /*
         Make the blur a function of the animationAmount. That way it will get blurrier as the button gets bigger.
         */
        // .blur(radius: (animationAmount - 1 ) * 3)
        /*
         Different animations, easout, ease in, spring, etc.
         */
        //.animation(.easeOut)
        /* Stiffness = initial velocity.
           damping = how long the spring should bounce back and forth
            Lower the damping, the longer it will bounce back and forth.
        */
       // .animation(.interpolatingSpring(stiffness: 100, damping: 5))
        /*
         Duration is in seconds.
         The animatin can take its own set of modifier such as delay.
         If we use modifiers on animation, the we have to call out the class explicitly.
         
         autoreverse will have it "bounce back" into position. Otherwise the animation will just start back at hte beginning.
         */
//        .animation(Animation.easeIn(duration: 1)
//                    .repeatForever(autoreverses: true))
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
