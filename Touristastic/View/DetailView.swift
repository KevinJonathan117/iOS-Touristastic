//
//  DetailView.swift
//  Touristastic
//
//  Created by Kevin Jonathan on 29/05/22.
//

import SwiftUI
import CoreLocation

struct DetailView: View {
    var place: Place
    
    var body: some View {
        ScrollView {
            VStack {
                Header()
                
                Content()
            }
            .navigationTitle("Place Detail")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private extension DetailView {
    @ViewBuilder func Header() -> some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: place.latitude ?? 0,
                                                   longitude: place.longitude ?? 0))
            .ignoresSafeArea(edges: .top)
            .frame(height: 300)
        
        AsyncImage(
            url: URL(string: place.image ?? ""),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .cornerRadius(8)
                    .shadow(radius: 7)
            },
            placeholder: {
                Spacer()
                
                EmptyView()
                    .frame(width: 120, height: 120)
                
                Spacer()
            }
        )
        .offset(y: -100)
        .padding(.bottom, -100)
    }
    
    @ViewBuilder func Content() -> some View {
        Group {
            Text(place.name ?? "")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
            
            Text("\(place.address ?? "")")
                .foregroundColor(.gray)
                .font(.subheadline)
            
            Text(place.description ?? "")
        }
        .padding([.top, .leading, .trailing])
    }
}
