//  Date: 12/6/22
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI


struct ContentView: View {
    @State private var inputValue: Double = 0
    
    @State private var inputUnit: Dimension = UnitDuration.hours
    @State private var outputUnit: Dimension = UnitDuration.seconds
    
    @State private var selectedUnits = 2
    
    @FocusState private var inputIsFocused: Bool
    
    let conversionTypes = ["Temperature", "Length", "Time", "Volume"]
    var units: [[Dimension]] {
        let tempUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
        let lengthUnits: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
        let timeUnits: [UnitDuration] = [.seconds, .minutes, .hours]
        let volumeUnits: [UnitVolume] = [.milliliters, .liters, .cups, .pints, .gallons]
        
        return [
            tempUnits,
            lengthUnits,
            timeUnits,
            volumeUnits
        ]
    }
    
    let formatter: MeasurementFormatter
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .short
    }
    
    var result: String {
        let outputMeasurement = Measurement(value: inputValue, unit: inputUnit).converted(to: outputUnit)
        return formatter.string(from: outputMeasurement)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                } header: {
                    Text("Amount to Convert")
                        .heavyRoundedFont()
                }
                
                Section {
                    unitPicker(title: "Convert from Unit", selection: $inputUnit)
                    unitPicker(title: "Convert to Unit", selection: $outputUnit)
                } header: {
                    Text("\(formatter.string(from: inputUnit)) to \(formatter.string(from: outputUnit))")
                        .heavyRoundedFont()
                }
                
                Section {
                    Text(result)
                } header: {
                    Text("Result")
                        .heavyRoundedFont()
                }
                
                Picker("Conversion", selection: $selectedUnits) {
                    ForEach(0..<conversionTypes.count, id: \.self) {
                        Text(conversionTypes[$0])
                    }
                }
                .pickerStyle(.wheel)
                .frame(height: 170)
            }
            .navigationTitle("Convertia")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
            .onChange(of: selectedUnits) { newUnits in
                inputUnit = units[newUnits][0]
                outputUnit = units[newUnits][1]
            }
        }
    }
    
    private func unitPicker(title: String, selection: Binding<Dimension>) -> some View {
        Picker(title, selection: selection) {
            ForEach(units[selectedUnits], id: \.self) {
                Text(formatter.string(from: $0).capitalized)
            }
        }
        .pickerStyle(.segmented)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
