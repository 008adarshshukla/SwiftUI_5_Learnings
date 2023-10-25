//
//  ProblemView.swift
//  SwiftUI_5
//
//  Created by Adarsh Shukla on 16/10/23.
//

import SwiftUI

class Suspect: ObservableObject {
    @Published var name: String = ""
    @Published var suspiciousness: Int = 0
    
    init(name: String, suspiciousness: Int) {
        self.name = name
        self.suspiciousness = suspiciousness
    }
}

struct ProblemView: View {
    @StateObject var suspect = Suspect(name: "Adarsh", suspiciousness: 0)
    var body: some View {
        VStack {
            let _ = print("Problem View Body")
            Button("Increment") {
                suspect.suspiciousness += 1
            }
            .buttonStyle(.borderedProminent)
            
            SuspectView(suspect: suspect)
        }
    }
}


struct SuspectView: View {
    
    @ObservedObject var suspect: Suspect
    
    var body: some View {
        VStack {
            let _ = print("Suspect View Body")
//            Text(suspect.name)
//            Text(suspect.suspiciousness.description)
            Text("Hello World!!!")
        }
    }
}

#Preview {
    ProblemView()
}


//MARK: Problem
/*
 Any view holding onto an observable object will rerender its body every time its properties are manipulated (read or set) weather or not it uses the property as part of its view hierarchy.
 
 Case 1 - Let's say we have a view that is holding onto an observable object instance and only sets its property but does not use its in the view hierarchy. Even then this view gets rerendered when the property is manipulated.
 
 Case 2 - Let's say we have a view that is holding onto an observable object instance but it neither uses its property in view hierarchy not sets it via ay action, even then this view's body gets rerendered when the property is manipulated.
 
 This leads to major perfoemance issue.
 */
