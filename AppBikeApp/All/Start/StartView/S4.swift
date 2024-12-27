//
//  S4.swift
//  AppBikeApp
//
//  Created by IGOR on 25/12/2024.
//

import SwiftUI

struct S4: View {

    @StateObject var viewModel = StartViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("s4")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                                
                VStack(spacing: 30) {
                    
                    Text("Be Ready for Every Ride")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .bold))
                    
                    Text("Create item lists and assign tasks to participants. Everything you need is under control!")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    HStack {

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
                            .fill(.white)
                            .frame(width: 8)
                        
                        Circle()
                            .fill(.white.opacity(0.2))
                            .frame(width: 8)
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            S5()
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
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 0).fill(Color("bg")))
            }
        }
    }
}

#Preview {
    S4()
}
