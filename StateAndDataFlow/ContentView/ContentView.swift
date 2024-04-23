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
            
            startButtonView(contentViewVM: contentViewVM)
            
            Spacer()
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
    @Bindable var contentViewVM: ContentViewViewModel
    
    var body: some View {
        Button(action: contentViewVM.startTimer) {
            Text(contentViewVM.buttonTitle)
                .buttonFont()
        }
        .bordered(background: .red)
    }
}

struct FontViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.white)
    }
}

extension Text {
    func buttonFont() -> some View {
        modifier(FontViewModifier())
    }
}

struct BorderedViewModifier: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 60)
            .background(color)
            .clipShape(.rect(cornerRadius: 20))
            .overlay (
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 4)
            )
    }
}

extension Button {
    func bordered(background: Color) -> some View {
        modifier(BorderedViewModifier(color: background))
    }
}
