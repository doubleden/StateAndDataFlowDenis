//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(ContentViewViewModel.self) private var contentViewVM
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack {
            Text("Hi, \(loginViewVM.name)")
                .font(.title)
                .padding(.top, 100)
            
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
                
            Spacer()
            
            startButtonView()
            
            Spacer()
            
            logoutButtonView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(ContentViewViewModel())
        .environmentObject(LoginViewViewModel())
}

struct startButtonView: View {
    @Environment(ContentViewViewModel.self) private var contentViewVM
    
    var body: some View {
        Button(action: contentViewVM.startTimer) {
            Text(contentViewVM.buttonTitle)
                .buttonFont()
        }
        .bordered(background: .red)
    }
}

struct logoutButtonView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        Button(action: loginViewVM.logout, label: {
            Text("LogOut")
                .buttonFont()
        })
        .bordered(background: .blue)
    }
}

private extension Text {
    func buttonFont() -> some View {
        modifier(FontViewModifier())
    }
}

private extension Button {
    func bordered(background: Color) -> some View {
        modifier(BorderedViewModifier(color: background))
    }
}
