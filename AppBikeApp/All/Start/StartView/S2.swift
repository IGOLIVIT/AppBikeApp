//
//  S2.swift
//  AppBikeApp
//
//  Created by IGOR on 25/12/2024.
//

import SwiftUI

struct S2: View {

    @StateObject var viewModel = StartViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("s2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 7) {
                    
                    Text("Write information about your motorcycle")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                        .padding(.bottom)
                    
                    Text("Make and Model")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                    
                    ZStack(content: {
                        
                        Text("Make")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addMake.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addMake)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    
                    ZStack(content: {
                        
                        Text("Model")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addModel.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addModel)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    
                    Text("Make and Model")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                    
                    ZStack(content: {
                        
                        Text("Mileage")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addMileage.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addMileage)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    
                    ZStack(content: {
                        
                        Text("Year of release")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addYear.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addYear)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2").opacity(0.9)))
                .padding()
                
                VStack(spacing: 30) {
                    
                    Text("Tell me about your motorcycle")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .bold))
                        .padding(.bottom, 40)

                    
                    HStack {
                        
                        Circle()
                            .fill(.white.opacity(0.2))
                            .frame(width: 8)
                        
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
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            S3()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(10)
                                .padding(.horizontal)
                                .background(RoundedRectangle(cornerRadius: 6).fill(Color("prim")))
                        })
                        .onTapGesture {
                            
                            viewModel.make = viewModel.addMake
                            viewModel.Model = viewModel.addModel
                            viewModel.mileage = viewModel.addMileage
                            viewModel.yearRelease = viewModel.addYear
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    S2()
}
