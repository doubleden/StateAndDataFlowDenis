//
//  File.swift
//  StateAndDataFlow
//
//  Created by Denis Denisov on 23/4/24.
//

import SwiftUI

struct FontViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.white)
    }
}
