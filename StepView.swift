//
//  StepView.swift
//  real
//
//  Created by Adam Essawi on 7/24/23.
import SwiftUI
import CoreLocation
import MapKit

class LocationManagerWrapper: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var distanceTraveled: CLLocationDistance = 0.0
    @Published var isTracking = false
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    //Function to ask users for permission to track location,
    //and start updating location
    func startTracking() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        isTracking = true
    }
    //Function that stops location tracking
    func stopTracking() {
        locationManager.stopUpdatingLocation()
        isTracking = false
        distanceTraveled = 0.0
    }
    
    //If previous location is different from current location,
    //add this to the total distance traveled.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return }

        if let previousLocation = locationManager.location {
            let distance = newLocation.distance(from: previousLocation)
            distanceTraveled += distance
        }
    }

    //In case location tracking is broken
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location update failed with error: \(error.localizedDescription)")
    }

    //Exception thrown for when location tracking is denied
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .denied {
            print("Enable tracking in settings")
        }
    }
}


//Map of users current location
struct StepView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.7465, longitude: -74.0014),span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    @ObservedObject private var locationManager = LocationManagerWrapper()
    
    var body: some View {
        ScrollView {
            VStack {
            //Button allowing users to enable
            //location tracking
                Text("Track Your Run: ")
                    .font(.title)
                    .foregroundColor(.pink)
                    .bold()
                    .offset(x: -80, y: 40)
                
                Rectangle()
                    .frame(width: 480, height: 10)
                    .foregroundColor(.black)
                    .offset(y: 500)
                
                Map(coordinateRegion: $region)
                    .frame(width: 400, height: 430)
                
                    .offset(y: 20)
                
                
                
                Text("Distance Traveled: \(String(format: "%.2f", locationManager.distanceTraveled)) meters")
                    .padding()
                    .font(.title2)
                    .bold()
                    .offset(y: 50)
                    
                    
                
                
                Button(action: {
                    locationManager.startTracking()
                }) {
                    Text("Start My Run")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding()
                        .background(Color.pink)
                        .border(Color.black)
                        .bold()
                        .cornerRadius(200)
                        .offset(y: 40)
                }
                .padding()
                
            //Button allowing users to end location tracking
                Button(action: {
                    locationManager.stopTracking()
                }) {
                    Text("End My Run")
                    
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding()
                        .background(Color.pink)
                        .border(Color.black)
                        .bold()
                        .cornerRadius(200)
                        .offset(y: 30)
                }
                .padding()
                .disabled(!locationManager.isTracking)
            }
        }
    }
}
struct MView: View {
    var body: some View {
        NavigationView {
            StepView()
        
        }
    }
}

struct MView_Previews: PreviewProvider {
    static var previews: some View {
        MView()
    }
}
