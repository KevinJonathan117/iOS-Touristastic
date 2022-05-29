//
//  HomeView.swift
//  Touristastic
//
//  Created by Kevin Jonathan on 29/05/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if !viewModel.places.isEmpty {
                    ListView()
                } else {
                    Text("No Place Data")
                }
            }
            .navigationTitle("Touristastic")
            .toolbar {
                Button {
                    print("Navigated to Profile")
                } label: {
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            }
            .onAppear {
                viewModel.getPlaces()
            }
            .refreshable {
                viewModel.getPlaces()
            }
        }
    }
}

private extension HomeView {
    @ViewBuilder func ListView() -> some View {
        List(viewModel.places) { place in
            NavigationLink {
                DetailView(place: place)
            } label: {
                HStack {
                    AsyncImage(
                        url: URL(string: place.image ?? ""),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 120)
                                .cornerRadius(8)
                        },
                        placeholder: {
                            ProgressView()
                                .frame(width: 120, height: 120)
                        }
                    )
                    Text(place.name ?? "")
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                
            }
        }
    }
}
