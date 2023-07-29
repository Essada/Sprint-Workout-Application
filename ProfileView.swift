//
//  ProfileView.swift
//  real
//
//  Created by Adam Essawi on 6/18/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var showWaves = false
    @State private var pulsate = false
    @Binding var type: String //= "No Workout Selected"
    @Binding var workoutdate: Date //= Date()
    @Binding var emptylist: [dictitem] //= []
    @State var isLinkActive = false
    @State var isLinkActive1 = false
    @Binding var workoutlist: [workoutitem]
    @Binding var type1: String
    @Binding var duration: Int
    @Binding var MET: Int
    
    
    var body: some View {
        NavigationView {
            ZStack {
    
        //UI
    Text("Select a workout")
        .offset(y:-170)
        .bold()
        .font(.largeTitle)
        .padding(.horizontal, 10)
            
    Circle()
        .frame(width:100, height: 100)
        .foregroundColor(.pink)
        .shadow(radius: 25)
                
    //Button allowing users to either choose a workout
    //or customize their own
    Button(action: {
        self.isLinkActive1 = true
        }, label: {
            Image(systemName: "plus.circle.fill")
            .font(.system(size: 90))
            .foregroundColor(.white)
            .shadow(radius: 25)
            
    })
    NavigationLink( destination:
                                
    Workouts(type1: $type1, workoutlist: $workoutlist, duration: $duration, MET: $MET)
                                
           //getting rid of double back buttons
    .navigationBarBackButtonHidden(true), isActive: $isLinkActive1) {
        EmptyView()
            }
            //UI
        VStack{
            Text("Or")
            .bold()
            .font(.largeTitle)
            .padding(.horizontal, 10)
            .offset(y:360)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .offset(y:-40)
                
            Text("Customize your own")
                .bold()
                .font(.largeTitle)
                .padding(.horizontal, 10)
                .offset(y:390)
                
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .shadow(radius: 25)
                .offset(y:400)
              //customize your own workout
            //button
            Button(action: {
                self.isLinkActive = true
                }, label: {
                Image(systemName: "plus.circle.fill")
                .font(.system(size: 90))
                .foregroundColor(.white)
                .shadow(radius: 25)
                    
            })
            .offset(y:285)
                    
        }
    }
                
        .offset(y:-140)
            
        }
    }
}
        
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
