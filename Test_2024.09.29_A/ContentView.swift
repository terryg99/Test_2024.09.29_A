//
//  ContentView.swift
//  Test_2024.09.29_A
//
//  Created by Terry Gaul on 9/29/24.
//
// This is some new text (comment) since the previous commit

import SwiftUI
import OSLog

// These are needed to allow logging
let mySubsystem = Bundle.main.bundleIdentifier!
let category1 = Logger(subsystem: mySubsystem, category: "myCategory")


struct ContentView: View {
    var counter: Int = 0
    // This boolean controls borders and titles for all views
    @State var showDiagnostics: Bool = true
    var body: some View {
        // Three tabs, with child views
        VStack {
            TabView {
                Tab("Tab01", systemImage: "1.circle") {
                    Tab01View(showDiagnostics: $showDiagnostics)
                }
                Tab("Tab02", systemImage: "2.circle") {
                    Tab02View(show: $showDiagnostics)
                }
                Tab("Tab03", systemImage: "3.circle") {
                    Tab03View(show: $showDiagnostics)
                }
            }
        }
        .showDiagnostics(showDiagnostics, "\(Self.self)")
        .padding()
        .onAppear {
            category1.debug("\(Self.self) loaded")
        }
    }
}

struct Tab01View: View {
    @Binding var showDiagnostics: Bool
    var body: some View {
        VStack {
            Text("This is child view 01")
            Button("Button 01") {
                // action to be added later
            }
            .buttonStyle(.borderedProminent)
        }
        .frame(width: 300, height: 600)
        .background(Color.blue.opacity(0.20))
        .showDiagnostics(showDiagnostics, "\(Self.self)")
        .onAppear {
            category1.debug("\(Self.self) loaded")
        }
    }
}

struct Tab02View: View {
    @Binding var show: Bool
    var body: some View {
        VStack {
            Text("This is child view 02")
            Button("Button 02") {
                // action to be added later
            }
            .buttonStyle(.borderedProminent)
        }
        .frame(width: 300, height: 600)
        .background(Color.green.opacity(0.20))
        .showDiagnostics(show, "\(Self.self)")
        .onAppear {
            category1.debug("\(Self.self) loaded")
        }
    }
}

struct Tab03View: View {
    @Binding var show: Bool
    var body: some View {
        VStack {
            Text("This is child view 03")
            Button("Button 03") {
                // action to be added later
            }
            .buttonStyle(.borderedProminent)
        }
        .frame(width: 300, height: 600)
        .background(Color.red.opacity(0.20))
        .showDiagnostics(true, "\(Self.self)")
        .onAppear {
            category1.debug("\(Self.self) loaded")
        }
    }
}

extension View {
    // Create an extension to View so the transform (border and view name)
    //   can be applied to any View.
    // To use this, place a .showDiagnostics(show, "\(Self.self)") modifier on the
    //   view that you wish to
    @ViewBuilder func `showDiagnostics`(_ show: Bool,_ text: String) -> some View {
        self.border(.purple, width: show ? 2 : 0)
        // Note, self not used in subsequent modofiers because the first self
        //   creates a view and it only need be modified from them onwards.
            .overlay {
                VStack {
                    HStack{
                        Text("  \(text)").foregroundStyle(show ? .purple : .clear).font(.caption)
                        Spacer() }
                    Spacer()
                }
            }
    }
}


#Preview {
    ContentView()
}
