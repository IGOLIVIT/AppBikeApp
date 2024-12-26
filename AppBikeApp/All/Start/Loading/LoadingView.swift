//
//  LoadingView.swift
//  AppBikeApp
//
//  Created by IGOR on 25/12/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogotip")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 100)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 90)
            }
        }
    }
}

#Preview {
    LoadingView()
}
