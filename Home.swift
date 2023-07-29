//
//  Home.swift
//  real
//
//  Created by Adam Essawi on 6/19/23.
//

import SwiftUI

struct Home: View {
    @State var currentDate: Date = Date()
    @State var typeworkout: String = "No Type Selected"
    @Binding var workoutlist: [workoutitem]
    @Binding var duration: Int
    @Binding var MET: Int
    var body: some View {
        
        //Nav view that creates a scroll view
    NavigationView{
        ScrollView(.vertical, showsIndicators: false)
        {
        VStack(spacing: 20){
           
        NextView(currentDate: $currentDate, workoutlist: $workoutlist, duration: $duration, MET: $MET)
                }
            }
        }
    }
}
       
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
