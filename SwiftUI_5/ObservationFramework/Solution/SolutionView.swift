//
//  SolutionView.swift
//  SwiftUI_5
//
//  Created by Adarsh Shukla on 16/10/23.
//

import SwiftUI
import Observation

@Observable
class Suspect2 {
    var name: String = ""
    var suspiciousness: Int = 0
    
    init(name: String, suspiciousness: Int) {
        self.name = name
        self.suspiciousness = suspiciousness
    }
}

struct SolutionView: View {
    @State var suspect = Suspect2(name: "Adarsh", suspiciousness: 0)
    var body: some View {
        VStack {
            let _ = print("Solution View Body")
            Button("Increment") {
                suspect.suspiciousness += 1
            }
            .buttonStyle(.borderedProminent)
            
            //Text(suspect.suspiciousness.description)
            
            Spacer()
            
            SuspectView2(suspect: suspect)
        }
    }
}

struct SuspectView2: View {
    var suspect: Suspect2
    var body: some View {
        VStack {
            let _ = print("Suspect2 View Body")
            Text(suspect.name)
            //Text(suspect.suspiciousness.description)
            Text("Hello World!!!")
        }
    }
}


#Preview {
    SolutionView()
}
