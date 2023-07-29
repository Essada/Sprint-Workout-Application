//
//  DatePick.swift
//  real
//
//  Created by Adam Essawi on 6/22/23.
//

import SwiftUI
var diddytap: Bool = false
import SwiftUI
struct DatePick: View {
@State private var didTap: Bool = false
@State private var didTap1: Bool = false
@State private var birthdate = Date()
@Binding var type: String
@Binding var workoutdate: Date
@Binding var emptylist: [dictitem]
@Binding var workoutlist: [workoutitem]

    var body: some View {
        
        VStack{
            //UI
            Text("First, Please Select A Date & Time")
                .padding()
                .font(.title3.bold())
                .bold()
        
            Form {
                //allowing users to selct a date for their
                //workout
                DatePicker("Birthdate", selection: $birthdate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                HStack{
                    Text("\(birthdate)")
                        .bold()
                        .foregroundColor(.black)
                }
            }
            
        Spacer()
        Text("Now, Select your workout below:")
        .font(.title3.bold())
        Spacer()
                
        Circle()
            .frame(width: 120, height: 120)
            //Button allowing users to select
            //a workout with sprint endurance focus
            VStack {
                Button(action: {
                    let type = dictitem(name: "Sprint Endurance Workout", date: birthdate)
                    emptylist.append(type)
                        }, label: {
                            Text("Sprint Endurance")
                                .padding(.horizontal, 10)
                                .padding(.vertical, 20)
                                .background(didTap ? Color.blue : Color.orange)
                                .foregroundColor(.black)
                                cornerRadius(20)
                                .bold()
                        })
                    }
                
        //Button that allows users to select
            //a workout with fast twitch style
        Button(action: {
            
            let type = dictitem(name: "Fast Twitch  Workout", date: birthdate)
                emptylist.append(type)
                }, label: {
            Text("Fast Twitch Workout")
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(didTap ? Color.blue : Color.green)
                    .foregroundColor(.black)
                    //.cornerRadius(20)
                    .bold()
                    .offset(y:-8)
                })
                
         //Button that allows users to select a workout
            //with slow twitch style
        Button(action: {
            let type = dictitem(name: "Slow Twitch/ Full Endurance Workout", date: birthdate)
                emptylist.append(type)
                    
            }, label: {
            Text("Slow Twitch / Full Endurance Workout")
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(didTap ? Color.blue : Color.yellow)
                .foregroundColor(.black)
                .cornerRadius(1)
                .bold()
                .offset(y:-16)
                    
            })
            }
        }
    }

struct DatePick_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            }
        }


