//
//  ViceOver.swift
//  SwiftUI_5
//
//  Created by Adarsh Shukla on 25/10/23.
//

import SwiftUI

struct ViceOver: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle("Volume", isOn: $isActive)
                    HStack {
                        Text("Volume")
                        Spacer()
                        Text(isActive ? "ON" : "OFF")
                    }
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        isActive.toggle()
                    }
                } header: {
                    Text("PREFERENCES")
                }
                
                Section {
                    Button("Favourites") {
                        
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "heart.fill")
                    }
                    
                    Text("Favourites")
                        .onTapGesture {
                            
                        }

                } header: {
                    Text("APPLICATION")
                }
                
                VStack {
                    Text("CONTENT")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 8, content: {
                            ForEach(0..<10) { x in
                                VStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(width: 100, height: 100)
                                    Text("Item \(x+1)")
                                }
                            }
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    ViceOver()
}
