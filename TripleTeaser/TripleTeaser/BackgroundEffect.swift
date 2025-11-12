//
//  BackgroundEffect.swift
//  TripleTeaser
//
//  Created by Andrew Micenko on 11/11/2025.
//

import SwiftUI

struct BackgroundEffect: ViewModifier {

    func body(content: Content) -> some View {
        GlassEffectContainer {
            ZStack {
                content.font(.system(size: 250))

                content.frame(maxWidth: .infinity).glassEffect(
                    .clear,
                    in: .capsule
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .cornerRadius(20)
        }
    }
}

extension View {
    func withBackgroundEffect() -> some View {
        modifier(BackgroundEffect())
    }
}
