//
//  ContentView.swift
//  WeSplit
//
//  Created by Brian Vo on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    
    var body: some View {
        Form{
            TextField("Enter your name", text: $name)
            Text("Hello \(name)")
        }
    }
}

#Preview {
    ContentView()
}
