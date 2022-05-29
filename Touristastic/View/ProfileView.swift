//
//  ProfileView.swift
//  Touristastic
//
//  Created by Kevin Jonathan on 29/05/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            Group {
                CircleImage(image: Image("Kevin"))
                
                VStack(alignment: .leading) {
                    Text("Kevin Jonathan")
                        .font(.title)
                    
                    Text("Student at Petra Christian University")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("About Kevin")
                        .font(.title2)
                        .bold()
                    Text("My name is Kevin Jonathan. I'm a final year student in the Faculty of Industrial Technology at Petra Christian University. I have 4 years of experience in mobile application development and 10 months of internship in Apple Developer Academy @UC.\n\nI am interested in both UI/UX design and iOS app development and soon graduating from Petra Christian University with a degree of IT. I love to socialize and collaborate with teams when it comes to project related works. I’ve always enjoyed in learning new things and came up with solutions of a problem.\n\nI am currently an intern at Blibli.com as an iOS Developer!")
                }
            }
            .padding()
        }
        .navigationTitle("My Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}
