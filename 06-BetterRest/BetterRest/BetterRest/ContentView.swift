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
                        Icon("clock")
                        DatePicker("Enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    }
                } header: {
                    HeaderFont("When do you want to wake up?")
                }
                
                Section {
                    HStack {
                        Icon("bed.double")
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    }
                } header: {
                    HeaderFont("Desired amount of sleep")
                }
                
                Section {
                    HStack {
                        Icon("cup.and.saucer")
                        Picker("^[\(coffeeAmount) cup](inflect: true)", selection: $coffeeAmount) {
                            ForEach(1...20, id: \.self) {
                                Text("^[\($0) cup](inflect: true)")
                            }
                        }
                    }
                } header: {
                    HeaderFont("Daily coffee intake")
                }
                
                Section {
                    VStack {
                        Text("Recommended bedtime")
                            .foregroundStyle(.pink)
                        Text(calculateBedtime())
                            .font(.title2.bold())
                            .padding(5)
                    }
                    .padding(15)
                }
                .frame(maxWidth: .infinity)
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
