//
//  BorderedViewModifier.swift
//  StateAndDataFlow
//
//  Created by Denis Denisov on 23/4/24.
//

import SwiftUI

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
