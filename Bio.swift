//
//  Bio.swift
//  real
//
//  Created by Adam Essawi on 6/28/23.
//

import SwiftUI

struct Bio: View {
    @State private var wave = false
    @State private var wave1 = false
    @State private var Height = ""
    @State private var Weight = ""
    @State private var Age = ""
    @State private var wave2 = false
    @State public var sum = 0
    @State private var sum1 = 0
    @Binding var workoutlist: [workoutitem]
    @Binding var duration: Int
    @Binding var MET: Int

    var body: some View {
        
        //Init variables for users to enter their biometrics.
        let myInt1 = Int(Height) ?? 0
        let myInt2 = Int(Weight) ?? 0
        let myInt3 = Int(Age) ?? 0
        
        //UI to display users caloric expenditure and Basal Metabolic Rate.
        ZStack{
           Group {
               Text("Calories Burnt: ")
                   .bold()
                   .font(.title3)
                   .offset(x: -80, y: -160)
                   .opacity(0.7)
                   
               //Algorithm to determine users caloric expenditure
               Text("\((duration * MET * 3 * myInt2) / 200)")
                   .padding()
                   .bold()
                   .frame(width: 180, height: 27)
                   .background(Color.pink)
                   .border(.black, width: 1.5)
                   .cornerRadius(10)
                   .offset(y: -120)
               
              Text("Basal Metabolic Rate: ")
                   .bold()
                   .font(.title3)
                   .offset(x: -50, y: -90)
               
               //Algorithim to determine users BMR.
               
               Text("\((10 * myInt2) + (6 * myInt1 * 2) - (5 * myInt3) + 5)")
                   .padding()
                   .frame(width: 180, height: 27)
                   .background(Color.pink)
                   
                   .border(.black, width: 1.5)
                   .cornerRadius(10)
                   .offset(y: -60)
                   
               //<title />
                Text("Calories Burnt & BMR: ")
                    .bold()
                    .font(.title)
                    .offset(x: 10, y: -200)
          
           
                Text("My Fitness & Stats:")
                    .offset(x: -40, y: -240)
                    .bold()
                    .font(.title)
                    .offset(x: 130, y: -20)
                    .foregroundColor(.pink)
                
               //UI
                Rectangle()
                    .frame(width: 480, height: 10)
                    .offset(y: -230)
                    .foregroundColor(.pink)
              
               //Animation of circle to obtain pulsating effect.
                Circle()
                    .stroke(lineWidth: 40)
                    .frame(width: 95, height: 95)
                    .foregroundColor(.blue)
                    .scaleEffect(wave ? 1.5 : 1)
                    .opacity(wave ? 0.1: 1)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true).speed(0.5))
                    .onAppear() {
                        self.wave.toggle()
                    }
                    .offset(x: -40, y: 170)
                //UI
                Text("Height: ")
                    .offset(y:-120)
                    .offset(x: 6)
                    .padding(10)
                    .bold()
                    .font(.title)
                    .offset(x: -40, y: 170)
            }
            //Circle where users can enter their height
            Circle()
                .frame(width:150, height: 150)
                .foregroundColor(.white)
                .shadow(radius: 25)
                .offset(x: -40, y: 170)
            VStack{
                TextField("Type Here:", text: $Height)
                    .offset(x:200)
                    .bold()
                    .foregroundColor(.black)
                    .offset(x: -40, y: 180)
                Text("Inches")
                    .offset(y:-20)
                    .font(.title3)
                    .padding(10)
                    .bold()
                    .offset(x: -40, y: 185)
            }
            //Second pulsating circle animation.
            Circle()
                .stroke(lineWidth: 40)
                .frame(width: 95, height: 95)
                .foregroundColor(.pink)
                .scaleEffect(wave1 ? 1.5 : 1)
                .opacity(wave1 ? 0.1: 1)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true).speed(0.5))
                .onAppear() {
                    self.wave1.toggle()
                }
                .offset(x: 110, y: 345)
           //UI
            Text("Weight: ")
                .offset(x: 118, y: 225)
                .bold()
                .font(.title)
            //Circle where user can enter their weight
            Circle()
                .frame(width:150, height: 150)
                .foregroundColor(.white)
                .shadow(radius: 25)
                .offset(x: 110, y:345)
            
            VStack {
                TextField("Type Here:", text: $Weight)
                    .offset(x:305, y: 350)
                    .bold()
                    .foregroundColor(.black)
                Text("Pounds")
                    .offset(x: 110, y:335)
                    .font(.title3)
                    .padding(10)
                    .bold()
            }
            //Third pulsating circle animation
            Circle()
                .stroke(lineWidth: 40)
                .frame(width: 50, height: 50)
                .foregroundColor(.orange)
                .scaleEffect(wave2 ? 1.5 : 1)
                .opacity(wave2 ? 0.1: 1)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true).speed(0.5))
                .onAppear() {
                    self.wave2.toggle()
                }
                .offset(x: 150, y:100)
            Group {
                //Circle where users can enter their Age.
                Circle()
                    .frame(width:100, height: 100)
                    .foregroundColor(.white)
                    .shadow(radius: 25)
                    .offset(x: 150, y:100)
                
                VStack {
                    TextField("Type here: ", text: $Age)
                        .offset(x: 345, y: 120)
                        .bold()
                        .foregroundColor(.black)
                    Text("Years")
                        .offset(x: 150, y: 110)
                        .bold()
                        .font(.title3)
                    Text("Age: ")
                        .font(.title)
                        .bold()
                        .offset(x: 160, y: -15)
                }
            }
        }
        
        .offset(x: -40, y:-90)
    }
}



        
struct Bio_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
        
    }
}
