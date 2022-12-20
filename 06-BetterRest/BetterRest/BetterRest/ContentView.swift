//  Date: 12/17/22
//
//  Author: Zai Santillan
//  Github: @plskz


import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    static var defaultWakeTime: Date {
        let components = DateComponents(hour: 7, minute: 0)
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Image(systemName: "clock")
                            .foregroundStyle(.blue)
                        DatePicker("Enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    }
                } header: {
                    HeaderFont("When do you want to wake up?")
                }
                
                Section {
                    HStack {
                        Image(systemName: "bed.double")
                            .foregroundStyle(.blue)
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    }
                } header: {
                    HeaderFont("Desired amount of sleep")
                }
                
                Section {
                    HStack {
                        Image(systemName: "cup.and.saucer")
                            .foregroundStyle(.blue)
                        Picker(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", selection: $coffeeAmount) {
                            ForEach(1...20, id: \.self) {
                                Text($0 == 1 ? "1 cup" : "\($0) cups")
                            }
                        }
                    }
                } header: {
                    HeaderFont("Daily coffee intake")
                }
                
                Section {
                    HStack {
                        Image(systemName: "moon.stars")
                            .foregroundStyle(.blue)
                        Text(calculateBedtime())
                    }
                } header: {
                    HeaderFont("Recommended bed time")
                }
            }
            .navigationTitle("BetterRest 🌙")
        }
    }
    
    func calculateBedtime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(
                wake: Double(hour + minute),
                estimatedSleep: sleepAmount,
                coffee: Double(coffeeAmount)
            )
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "Error"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
