//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    private let contentViewVM = ContentViewViewModel()

    var body: some View {
        VStack {
            Text("Hi, \(loginViewVM.user.name)")
                .font(.title)
                .padding(.top, 100)
            
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
                
            Spacer()
            
            buttonView(
                color: .red,
                text: contentViewVM.buttonTitle,
                action: contentViewVM.startTimer
            )
            
            Spacer()
            
            buttonView(
                color: .blue,
                text: "LogOut",
                action: loginViewVM.logout
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(LoginViewViewModel())
}

struct buttonView: View {
    let color: Color
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .clipShape(.rect(cornerRadius: 20))
        .overlay (
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}
