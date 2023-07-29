//
//  workout.swift
//  real
//
//  Created by Adam Essawi on 7/2/23.
//

import Foundation

struct workoutitem: Identifiable {
    
    let id = UUID()
    let focus: String
    let date1: Date
    let goal: String
    let rest: String
    let title: String
    let duration: Int
    let MET: Float
    
}
