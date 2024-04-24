//
//  ContentView.swift
//  WeSplit
//
//  Created by Brian Vo on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool
    
    var totalPerPerson: Double{
//         Calculate this value
//        I believe we did this because we had our initial value of 2 but it displayed 4 which messes up our default display value
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmmount / 100 * tipSelection
        let grandTotal = checkAmmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        
        return amountPerPerson
    }
    
    var grandTotal : Double{
        let tipSelection = Double(tipPercentage) / 100 * checkAmmount
        let grandTotal = Double(checkAmmount) + tipSelection
        
        return grandTotal
    }
    
    let tipPercentages = [10, 15, 20, 25]
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Check ammount", value: $checkAmmount, format: .currency(code: Locale.current.currency?.identifier ??  "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("How much do you want to tip?"){
            
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0..<101){
                            Text("\($0) %")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("TOTAL + TIP"){
                    Text(grandTotal,  format:
                            .currency(code: Locale.current.currency?
                                .identifier ?? "USD"))
                }
                
                Section("Amount per person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ??  "USD") )
                    
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar{
                if amountIsFocused{
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
