//
//  SettingsView.swift
//  AppBikeApp
//
//  Created by IGOR on 25/12/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            Text("Rate the app")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .background(RoundedRectangle(cornerRadius: 6).fill(Color("bg2")))
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/1a6b909f-6c66-4aa8-bc57-4edeefa793bc") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            Text("Usage Policy")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .background(RoundedRectangle(cornerRadius: 6).fill(Color("bg2")))
                        })
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
