//
//  NextView.swift
//  real
//
//  Created by Adam Essawi on 6/16/23.
//

import SwiftUI

extension DateFormatter {
    static let displayDate: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateFormat = "EEEE, MMMM dd"
         return formatter
    }()
}


struct NextView: View {
@State private var birthdate = Date()
@State private var newdate = Date()
@Binding var currentDate: Date
@State var currentMonth: Int = 0
@State var type: String = "No Workout Selected"
@State var workoutdate: Date = Date()
@State var emptylist: [dictitem] = []
@Binding var workoutlist: [workoutitem]
@State var type1: String = "No Workout Selected"
@Binding var duration: Int
@Binding var MET: Int
    
var body: some View {
        
VStack(spacing: 35){
//Calendar UI, setting up the days of the week.
    let days: [String] =
            ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    HStack(spacing: 20){
        VStack(alignment: .leading, spacing: 10) {
            Text(extraData()[0])
                .offset(x: 57)
                .font(.caption)
                .fontWeight(.semibold)
            Text(extraData()[1])
            .font(.title.bold())}
                .offset(y: 45)
                Spacer(minLength: 0)
                
    HStack {
        //Button that allows users to add a workout onto the calendar
        NavigationLink("Schedule Workout", destination:
                        ProfileView(type: $type, workoutdate: $workoutdate, emptylist: $emptylist, workoutlist: $workoutlist, type1: $type1, duration: $duration, MET: $MET)
                )}
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .foregroundColor(.white)
                .background(
                    Color.pink
                )
                .cornerRadius(30)
                .offset(x:70, y:15)
        //Button that allows users to go to the next month, or go back a month.
        Button{
            withAnimation{
                currentMonth -= 1
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title2)
            }
            .offset(y: 65)
    
        Button{
            withAnimation{
                currentMonth += 1
                }
            } label: {
                Image(systemName: "chevron.right")
                    .font(.title2)
            }
            .offset(y:65)
        }
        .padding(.horizontal)
            
            //for the days on the top of the calendar
        HStack(spacing: 0) {
            ForEach(days,id: \.self){day in
                Text(day)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .offset(y:40)
                }
                
            }
            //Setting up the calendar grid UI
        let columns = Array(repeating: GridItem(.flexible()), count: 7)
        LazyVGrid(columns: columns,spacing: 15) {
            ForEach(extractDate()){value in
                CardView(value:value)
                
                .background(
                //Pink overglow when a date is selected.
                Capsule()
                    .fill(.pink)
                    .padding(.horizontal, 8)
                    .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                    .offset(y:-23)
                        )
                    .onTapGesture {
                        currentDate =  value.date
                        }
                }
                .offset(y:55)
            }
    VStack(spacing: 15) {
                
    //UI under the calendar.
    Text("Your Scheduled Workouts")
        .font(.title2.bold())
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 20)
     
    //displaying each date on the calendar
    ForEach(emptylist, id: \.id, content: { item in
        if (Text(DateFormatter.displayDate.string(from: item.date ?? Date())) ==
                Text(DateFormatter.displayDate.string(from: currentDate ?? Date()))){
                    
        //date selected, time it was selected,
            //and what was selected all displayed
        VStack{
            Text(birthdate, style: .time)
                .offset(x:-60)
                .bold()
                Text(item.name)
                    .bold()
                    }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                            
                .background(
                            
                Color(.red)
                .opacity(0.5)
                .cornerRadius(10)
                    )
                }
            }
                    )
                        
        //Displaying all elements of the workout that has
        //been selected onto the screen
        ForEach(workoutlist, id: \.id, content: {
            element in
                if
            (Text(DateFormatter.displayDate.string(from: element.date1 ?? Date())) ==
            Text(DateFormatter.displayDate.string(from: currentDate ?? Date()))){
                        
        VStack(alignment: .leading){
            Text(element.title)
            .bold()
            .font(.title2)
                            
        Text(birthdate, style: .time)
            .bold()
                            
        Text(element.focus)
            .bold()
                
        Text(element.goal)
            .bold()
                               
        Text(element.rest)
            .bold()
                              
                            
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
                        
            .background(
                            
            Color(.red)
            .opacity(0.5)
            .cornerRadius(10)
            )
                        
                        
        }
    })
                
                
               
                
                
        //Test case to see how workouts could be
        //displayed on the calendar
        if let task = tasks.first(where: { task in
        return isSameDay(date1: task.taskDate, date2: currentDate)
                    
        }){
                    
        ForEach(task.task){task in
                        
        VStack(alignment: .leading, spacing: 10) {
                            
        Text(task.time.addingTimeInterval(CGFloat.random(in: 0...5000)), style: .time)
                            
                            
        Text(task.title)
            .font(.title2.bold())
                }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
                        
            .background(
                            
                Color(.red)
                .opacity(0.5)
                .cornerRadius(10)
                )
            }
                    
        }
        else{
            Text("")
                }
            }
            .padding()
        }
        
       
    //On change of the month, fetch the new months
    //value
    
    .onChange(of: currentMonth) { newValue in
            
        currentDate = getCurrentMonth()
            
            
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue)-> some View {
        
    VStack{
        
        if value.day != -1 {
        if let task = tasks.first(where: { task in
                    
        return isSameDay(date1: task.taskDate, date2: value.date)
            }){
        Text("\(value.day)")
            .font(.title3.bold())
            .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white: .primary)
                .frame(maxWidth: .infinity)
                    
                    
        Spacer()
                    
        Circle()
            .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .pink)
            .frame(width: 8, height: 8)
                    
                    
                }
        else{
                    
            Text("\(value.day)")
                .font(.title3.bold())
                .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white: .primary)
                .frame(maxWidth: .infinity)
                    
                    
                    
                Spacer()
            }
                
        }
    }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
        .offset(y:-23)
    }
    
    //if task was on the same date as date selected,
    //display task now.
    func isSameDay(date1: Date, date2: Date) ->Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    //Converts date in the right corner to "Year/Month"
    //format
    func extraData() ->[String]{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
        
        
        
    }
    //Month function
    func getCurrentMonth() ->Date{
        
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else{
            return Date()
        }
        
        return currentMonth
    }
    //Obtains the date value being selected
    func extractDate() ->[DateValue] {
        
    let calendar = Calendar.current
        
    let currentMonth = getCurrentMonth()
        
        
    var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            
            
            
        let day = calendar.component(.day, from: date)
            
        return DateValue(day: day, date: date)
            
    }
        
    //obtains the first weekday of each week to
        //be displayed
    let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        
    for _ in 0..<firstWeekday - 1 {
        days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
    return days
        
    }
    
    struct NextView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
    extension Date {
        func getAllDates()->[Date] {
            
            
        let calendar = Calendar.current
            
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
        //range of calendar days from 1-end of month
        let range = calendar.range(of: .day, in: .month, for: startDate)!
            
            
        return range.compactMap { day -> Date in
                
        return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
            }
            
        }
        
    }
    
    

