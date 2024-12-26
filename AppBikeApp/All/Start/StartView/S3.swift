//
//  S3.swift
//  AppBikeApp
//
//  Created by IGOR on 25/12/2024.
//

import SwiftUI

struct S3: View {

    @StateObject var viewModel = StartViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("s3")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 7) {
                    
                    Text("Choose the type of your motorcycle")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                        .padding(.bottom)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                       
                        ForEach(viewModel.typesMoto, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currMoto = index
                                
                            }, label: {
                                
                                VStack {
                                    
                                    Image(index)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 130)
                                    
                                    Text(index)
                                        .foregroundColor(viewModel.currMoto == index ? .black : .white)
                                        .font(.system(size: 18, weight: .regular))
                                        .padding(.vertical, 5)
                                }
                                .padding(8)
                                .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.currMoto == index ? Color("prim") : .white.opacity(0.1)))
                            })
                        }
                        
                    })
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
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 40)

                    
                    HStack {
                        
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
                        
                        Circle()
                            .fill(.white.opacity(0.2))
                            .frame(width: 8)
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            S4()
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
                            
                            viewModel.motoType = viewModel.currMoto
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    S3()
}
