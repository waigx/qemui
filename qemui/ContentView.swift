//
//  ContentView.swift
//  qemui
//
//  Created by Igor Wang on 4/13/20.
//  Copyright © 2020 Yigong Wang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showingSheet = false

    var body: some View {
        VStack {
            Text("Hello, World!")
                .frame(width: 500, height: 500)

            Button(action:{
                self.showingSheet.toggle()
            }){
                Text("123")
            }.sheet(isPresented: $showingSheet) {
                ImageLayer()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
