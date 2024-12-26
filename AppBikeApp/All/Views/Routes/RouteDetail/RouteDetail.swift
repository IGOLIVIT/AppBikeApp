//
//  RouteDetail.swift
//  AppBikeApp
//
//  Created by IGOR on 26/12/2024.
//

import SwiftUI

struct RouteDetail: View {
    
    @StateObject var viewModel: RoutesViewModel
    
    var body: some View {

        ZStack {
            
            Color("\(viewModel.selectedRoute?.roColor ?? "")")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedRoute?.roName ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDetail = false
                            }
                            
                        }, label: {
                            
                            Text("Close")
                                .foregroundColor(Color.white)
                                .font(.system(size: 17, weight: .regular))
                        })
                        
                        Spacer()
                        
                        Menu(content: {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDelete = true
                                }
                                
                            }, label: {
                                
                                Text("Delete")
                            })
                            
                        }, label: {
                            
                            Text("...")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                        })
                    }
                }
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Date")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("\(viewModel.selectedRoute?.roSDate ?? "") - \(viewModel.selectedRoute?.roFDate ?? "")")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.15)))
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Route type")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(viewModel.selectedRoute?.roType ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.15)))
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Country")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(viewModel.selectedRoute?.roCountry ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.15)))
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Locality")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(viewModel.selectedRoute?.roLoc ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.15)))
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Motorcycle type")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text(viewModel.selectedRoute?.roMType ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.15)))
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Participants count")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text(viewModel.selectedRoute?.roPart ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.15)))
                    }
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack(spacing: 19) {

                    Text("Do you want to delete?")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteRoute(withRoName: viewModel.selectedRoute?.roName ?? "", completion: {
                                
                                viewModel.fetchRoutes()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                                viewModel.isDetail = false
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                    }
                    .padding(.top, 25)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    RouteDetail(viewModel: RoutesViewModel())
}
