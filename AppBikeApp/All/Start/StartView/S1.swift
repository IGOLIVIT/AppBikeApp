//
//  S1.swift
//  AppBikeApp
//
//  Created by IGOR on 25/12/2024.
//

import SwiftUI

struct S1: View {
    
    @StateObject var viewModel = StartViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("s1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 30) {
                    
                    Text("Welcome!")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .bold))
                    
                    Text("Your ultimate motorcycle riding companion. Plan your rides, keep track of your gear and keep everything under control.")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    HStack {
                        
                        Circle()
                            .fill(.white)
                            .frame(width: 8)
                        
                        Circle()
                            .fill(.white.opacity(0.2))
                            .frame(width: 8)
                        
                        Circle()
                            .fill(.white.opacity(0.2))
                            .frame(width: 8)
                        
                        Circle()
                            .fill(.white.opacity(0.2))
                            .frame(width: 8)
                        
                        Circle()
                            .fill(.white.opacity(0.2))
                            .frame(width: 8)
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            S2()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(10)
                                .padding(.horizontal)
                                .background(RoundedRectangle(cornerRadius: 6).fill(Color("prim")))
                        })
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    S1()
}
