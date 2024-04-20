//
//  ContentView.swift
//  WeSplit
//
//  Created by Brian Vo on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    let students = ["Lebron", "Bvo", "BigT"]
    @State private var selectedStudent = "BigT"
    
    var body: some View {
        Form{
            Picker("Select your student", selection: $selectedStudent){
                // \.self basically is how we identify each one and in this case the string itself is how it identifies itself.
                ForEach(students, id: \.self){
                    Text($0)
                }
            }
            
        }
        .navigationTitle("Select a student")
    }
}

#Preview {
    ContentView()
}
