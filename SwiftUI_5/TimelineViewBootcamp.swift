//
//  TimelineViewBootcamp.swift
//  SwiftUI_5
//
//  Created by Adarsh Shukla on 25/10/23.
//

import SwiftUI

struct TimelineViewBootcamp: View {
    @State private var startTime: Date = .now
    var body: some View {
        VStack {
            TimelineView(.animation(minimumInterval: 1, paused: false)) { context in
                Text("\(context.date)")
                Text("\(context.date.timeIntervalSince1970)")
                
                let seconds = context.date.timeIntervalSince(startTime)
                Text("\(seconds)")
                
                Rectangle()
                    .frame(width: seconds < 10 ? 50 : seconds < 30 ? 200 : 400, height: 100)
                    .animation(.bouncy, value: seconds)
            }
        }
    }
}

#Preview {
    TimelineViewBootcamp()
}

struct TimelineViewBootcamp2: View {
    var body: some View {
        TimelineView(.animation) { context in
            let date = context.date
            let value = context.cadence <= .live ?
            nanosValue(for: date): secondsValue(for: date)
            
            Circle()
                .trim(from: 0, to: value)
                .stroke()
        }
    }
    
    private func secondsValue(for date: Date) -> Double {
        let seconds = Calendar.current.component(.second, from: date)
        return Double(seconds) / 60
    }
    
    private func nanosValue(for date: Date) -> Double {
        let seconds = Calendar.current.component(.second, from: date)
        let nanos = Calendar.current.component(.nanosecond, from: date)
        return Double(seconds * 1_000_000_000 + nanos) / 60_000_000_000
    }
}

#Preview {
    TimelineViewBootcamp2()
}

struct TimelineViewBootcamp3: View {
    var body: some View {
        TimelineView(.periodic(from: .now, by: 5)) { context in
            let value = secondsValue(for: context.date)
            
            Circle()
                .trim(from: 0, to: value)
                .stroke()
        }    }
    
    private func secondsValue(for date: Date) -> Double {
        let seconds = Calendar.current.component(.second, from: date)
        return Double(seconds) / 60
    }
    
}

/*
 The timeline view updates its content at the start date, and then again at dates separated in time by the interval amount, which is every five seconds in the example above.
 */

#Preview {
    TimelineViewBootcamp3()
}
//MARK: Perform tasks or animations baased on Time.
/*
 TimelineView
 A view that updates according to a schedule that you provide.
 */

/*
 https://swiftwithmajid.com/2022/05/18/mastering-timelineview-in-swiftui/
 */
