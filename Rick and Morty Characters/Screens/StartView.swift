//
//  StartView.swift
//  Rick and Morty Characters
//
//  Created by Dmytro Horodyskyi on 28.12.2024.
//

import SwiftUI

struct StartView: View {

    var body: some View {
        NavigationView {
            ZStack {
                Image("start_wallpaper")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Text("Rick & Morty Characters")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink(destination: CharacterListView(viewModel: CharacterListViewModel())) {
                        Text("Watch all characters")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    StartView()
}

