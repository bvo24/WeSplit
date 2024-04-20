//
//  ContentView.swift
//  WeSplit
//
//  Created by Brian Vo on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Text("Hello, World")
                }
            
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
