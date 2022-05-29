//
//  CircleImage.swift
//  Touristastic
//
//  Created by Kevin Jonathan on 29/05/22.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 3)
            }
            .shadow(radius: 7)
    }
}
