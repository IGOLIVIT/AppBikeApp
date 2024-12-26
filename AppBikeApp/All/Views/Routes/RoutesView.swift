//
//  RoutesView.swift
//  AppBikeApp
//
//  Created by IGOR on 25/12/2024.
//

import SwiftUI

struct RoutesView: View {
    
    @StateObject var viewModel = RoutesViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Your routes")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.routeFilter = "All"
                            
                        }, label: {
                            
                            Text("All")
                                .foregroundColor(viewModel.routeFilter == "All" ? .black : .white)
                                .font(.system(size: 14, weight: .regular))
                                .padding(8)
                                .padding(.horizontal, 5)
                                .background(RoundedRectangle(cornerRadius: 5).fill(viewModel.routeFilter == "All" ? Color("prim") : .white.opacity(0.1)))
                        })
                        
                        ForEach(viewModel.typesRoute, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.routeFilter = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(viewModel.routeFilter == index ? .black : .white)
                                    .font(.system(size: 14, weight: .regular))
                                    .padding(8)
                                    .padding(.horizontal, 5)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(viewModel.routeFilter == index ? Color("prim") : .white.opacity(0.1)))
                            })
                        }
                    }
                }
                .padding(.bottom, 30)
                
                if viewModel.routes.isEmpty {
                    
                    VStack(spacing: 20) {
                        
                        Image("empty")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 130)
                        
                        Text("No routes yet")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("Add route +")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                                .padding(8)
                                .padding(.horizontal, 5)
                                .background(RoundedRectangle(cornerRadius: 6).fill(Color("prim")))
                        })
                    }
                    
                    Spacer()
                    
                } else {
                    
                    if viewModel.routeFilter == "All" {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isAdd = true
                                    }
                                    
                                }, label: {
                                    
                                    Text("New route +")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 35)
                                        .background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.2)))
                                })
                                .padding(.bottom, 5)
                                
                                ForEach(viewModel.routes, id: \.self) { index in
                                
                                    VStack(alignment: .leading, spacing: 16) {
                                        
                                        Text(index.roName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .medium))
                                        
                                        HStack {
                                            
                                            Text(index.roType ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(4)
                                                .padding(.horizontal, 4)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                                            
                                            Text("\(index.roSDate ?? "") - \(index.roFDate ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                        }
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedRoute = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDetail = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "arrow.up.right")
                                                .foregroundColor(.white)
                                                .font(.system(size: 24, weight: .medium))
                                        })
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .frame(height: 150)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("\(index.roColor ?? "")")))
                                }
                            }
                        }
                        
                    } else {
                        
                        if viewModel.routes.filter({($0.roType ?? "") == viewModel.routeFilter}).isEmpty {
                            
                            Text("Empty")
                                .foregroundColor(.white)
                                .font(.system(size: 26, weight: .semibold))
                                .padding(.top)
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = true
                                }
                                
                            }, label: {
                                
                                Text("Add route +")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .padding(8)
                                    .padding(.horizontal, 5)
                                    .background(RoundedRectangle(cornerRadius: 6).fill(Color("prim")))
                            })
                            
                            Spacer()
                            
                        } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isAdd = true
                                    }
                                    
                                }, label: {
                                    
                                    Text("New route +")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 35)
                                        .background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.2)))
                                })
                                .padding(.bottom, 5)
                                
                                ForEach(viewModel.routes.filter{($0.roType ?? "") == viewModel.routeFilter}, id: \.self) { index in
                                    
                                    VStack(alignment: .leading, spacing: 16) {
                                        
                                        Text(index.roName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .medium))
                                        
                                        HStack {
                                            
                                            Text(index.roType ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(4)
                                                .padding(.horizontal, 4)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                                            
                                            Text("\(index.roSDate ?? "") - \(index.roFDate ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                        }
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedRoute = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDetail = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "arrow.up.right")
                                                .foregroundColor(.white)
                                                .font(.system(size: 24, weight: .medium))
                                        })
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .frame(height: 150)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("\(index.roColor ?? "")")))
                                }
                            }
                        }
                    }
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchRoutes()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddRoute(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            RouteDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    RoutesView()
}
