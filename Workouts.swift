//
//  Workouts.swift
//  real
//
//  Created by Adam Essawi on 6/28/23.
//

import SwiftUI

struct Workouts: View {
    @State private var newdate = Date()
    @State var showpopup = false
    @Binding var type1: String
    @Binding var workoutlist: [workoutitem]
    @State var k: Int = 0
    @Binding var duration: Int
    @Binding var MET: Int
    var body: some View {
        ScrollView{
            //UI that allows users to select workout of their choice and add it to the main calendar.
            VStack {
                Text("Workouts: ")
                    .bold()
                    .font(.title)
                Text("Level: Easy")
                    .bold()
                    .font(.title2)
                    .offset(y: 10)
                VStack{
                    Text("6 X 200 Meter Repeats:")
                        .bold()
                        .font(.title3)
                        .offset(x: -65, y: -57)
                        .foregroundColor(Color(.black))
                        .padding(.horizontal, 80)
                        .padding(.vertical, 70)
                        .background(Color.green)
                        .cornerRadius(20)
                    
                    Text("**Focus:** Maintaining a consistent time for all repitions.")
                        .offset(x: -20, y: -130)
                        .foregroundColor(Color(.black))
                    Spacer()
                    Text("**Goal**: Base Endurance")
                        .foregroundColor(Color(.black))
                        .offset(x: -90, y: -125)
                    Spacer()
                    Text("**Rest**: 1-2 Min between each repition")
                        .foregroundColor(Color(.black))
                        .offset(x: -35, y: -125)
                    //Button that enables popup of new calendar that allows users to select the date/time of their workout.
                    Button(action: {
                        showpopup = true
                        k = 1
                        duration = duration + 16
                        MET = MET + 3
                
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color(.black))
                        
                    })
                
                    .offset(x: 164, y: -262)
                    //K is the variable that allows the application
                    //to know which workout has been selected.
                    .popover(isPresented: $showpopup) {
                        VStack{
                            Button(action: {
                               
                                if (k == 1) {
                                    let type1 = workoutitem(focus: "Focus: Maintaining a consistent time for all repitions.", date1: newdate, goal:  "Goal: Base Endurance", rest: "Rest: 1-2 Min between each repition", title: "6 X 200 Meter Repeats:", duration: 16, MET: 3.0)
                                    
                                    workoutlist.append(type1)
                                    
                                }
                                
                                else if (k == 2) {
                                    let type1 =
                                    workoutitem(focus: "Focus: Pushing hard for the first 50 meters, and coasting the rest." , date1: newdate, goal: "Goal: Base Endurance / Speed", rest: "Rest: 2-3 Min between each repitition.", title: "8 X 150 Meter Repeats:", duration: 25, MET: 4.0)
                                    workoutlist.append(type1)
                                    
                                }
                                else if (k == 3) {
                                    let type1 = workoutitem(focus: "Focus: Maintaining form through the last 100 meter stretch.", date1: newdate, goal: "Endurance", rest: "2-3 Min between each repition.", title: "6 X 300 Meter Repeats:", duration: 30, MET: 5.0)
                                    
                                    workoutlist.append(type1)
                                    let duration = 30
                                    let MET = 5
                                }
                                
                                showpopup = false
                            },
                                   label: {
                                //Closes calendar pop-up
                                Text("Done")
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 3)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .foregroundColor(Color(.white))
                                    .bold()
                                    .font(.title3)
                                
                            })
                            
                            
                            .offset(x: 140, y: 5)
                            //Form that allows users to select a date.
                            
                            Form {
                                
                                Text("Please, select a date: ")
                                    .bold()
                                    .font(.title2)
                                    .foregroundColor(.pink)
                                
                                DatePicker("newdate", selection: $newdate)
                                .datePickerStyle(GraphicalDatePickerStyle())
                            }
                        }
                    }
                }
                VStack{
                    
                    Text("8 X 150 Meter Repeats:")
                        .bold()
                        .font(.title3)
                        .offset(x: -65, y: -57)
                        .foregroundColor(Color(.black))
                        .padding(.horizontal, 80)
                        .padding(.vertical, 70)
                        .background(Color.green)
                        .cornerRadius(20)
                    
                    Text("**Focus:** Pushing hard for the first 50 meters, coasting the rest")
                        .offset(x: -5, y: -130)
                        .foregroundColor(Color(.black))
                    Spacer()
                    Text("**Goal**: Base Endurance / Speed")
                        .foregroundColor(Color(.black))
                        .offset(x: -60, y: -125)
                    Spacer()
                    Text("**Rest**: 2-3 Min between each repition")
                        .foregroundColor(Color(.black))
                        .offset(x: -35, y: -125)
                    //Same principle as before, Different workout item. Could be automated with a function in the future.
                    
                    Button(action: {
                        showpopup = true
                        k = 2
                        duration = duration + 25
                        MET = MET + 4
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color(.black))
                        
                    })
                    .offset(x: 160, y:-260)
                }
                .offset(y: -115)
                
                Text("Level: Medium")
                    .offset(x: -2, y: -220)
                    .bold()
                    .font(.title2)
                VStack{
                    
                    Text("6 X 300 Meter Repeats:")
                        .bold()
                        .font(.title3)
                        .offset(x: -65, y: -57)
                        .foregroundColor(Color(.black))
                        .padding(.horizontal, 80)
                        .padding(.vertical, 70)
                        .background(Color.yellow)
                        .cornerRadius(20)
                    
                    Text("**Focus:** Maintaining form through the last 100 meter stretch")
                        .offset(x: 0, y: -130)
                        .foregroundColor(Color(.black))
                    Spacer()
                    Text("**Goal**: Endurance")
                        .foregroundColor(Color(.black))
                        .offset(x: -110, y: -130)
                    Spacer()
                    Text("**Rest**: 2-3 Min between each repition")
                        .foregroundColor(Color(.black))
                        .offset(x: -35, y: -125)
                    
                    Button(action: {
                        showpopup = true
                        k = 3
                        duration = duration + 30
                        MET = MET + 5
                        
                        
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color(.black))
                        
                    })
                    .offset(x: 160, y:-260)
                }
                .offset(y: -230)
            }
            
        }
    }
    
    
    
    
    
    
    struct Workouts_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
