//
//  AddRoute.swift
//  AppBikeApp
//
//  Created by IGOR on 25/12/2024.
//

import SwiftUI

struct AddRoute: View {
    
    @StateObject var viewModel: RoutesViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New route")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .regular))
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack {
                                
                                ForEach(viewModel.typesRoute, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currRoute = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(viewModel.currRoute == index ? .black : .white)
                                            .font(.system(size: 14, weight: .regular))
                                            .padding(8)
                                            .padding(.horizontal, 5)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(viewModel.currRoute == index ? Color("prim") : .white.opacity(0.1)))
                                    })
                                }
                            }
                        }
                        .padding(.bottom, 30)
                        
                        Text("Route card color")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack {
                                
                                ForEach(viewModel.colors, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currColor = index
                                        
                                    }, label: {
                                        
                                        ZStack {
                                            
                                            RoundedRectangle(cornerRadius: 6)
                                                .fill(Color("\(index)"))
                                                .frame(width: 100, height: 50)
                                            
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .medium))
                                                .opacity(viewModel.currColor == index ? 1 : 0)
                                        }
                                    })
                                }
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Route name")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter name")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.roName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.roName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        
                        Text("Country")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter country")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.roCountry.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.roCountry)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        
                        Text("Locality")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter locality")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.roLoc.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.roLoc)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        
                        HStack {
                            
                            VStack {
                                
                                Text("Motorcycle type")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack(content: {
                                    
                                    Text("Enter locality")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.roMType.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.roMType)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding(8)
                                .frame(maxWidth: .infinity)
                            }
                            
                            VStack {
                                
                                Text("Participants count")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack(content: {
                                    
                                    Button(action: {
                                        
                                        viewModel.PC -= 1
                                        
                                    }, label: {
                                        
                                        Text("-")
                                            .foregroundColor(.white)
                                            .font(.system(size: 29, weight: .regular))
                                            .padding(6)
                                            .padding(.horizontal, 10)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(.white.opacity(0.1)))
                                    })
                                    
                                    Text("\(viewModel.PC)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 19, weight: .regular))
                                        .padding(.horizontal)
                                    
                                    Button(action: {
                                        
                                        viewModel.PC += 1
                                        
                                    }, label: {
                                        
                                        Text("+")
                                            .foregroundColor(.white)
                                            .font(.system(size: 29, weight: .regular))
                                            .padding(6)
                                            .padding(.horizontal, 10)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(.white.opacity(0.1)))
                                    })
                                    
                                })
                                .frame(maxWidth: .infinity)
                            }
                        }
                        
                        HStack {
                            
                            VStack {
                                
                                Text("Start date")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack(content: {
                                    
                                    Text("MM/DD/YYYY")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.roSDate.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.roSDate)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding(8)
                                .frame(maxWidth: .infinity)
                            }
                            
                            VStack {
                                
                                Text("End date")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack(content: {
                                    
                                    Text("MM/DD/YYYY")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.roFDate.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.roFDate)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding(8)
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.bottom, 35)
                        
                        Button(action: {
                            
                            viewModel.roType = viewModel.currRoute
                            viewModel.roColor = viewModel.currColor
                            viewModel.roPart = String(viewModel.PC)
                            
                            viewModel.addRoute()
                            
                            viewModel.PC = 0
                            viewModel.currColor = ""
                            viewModel.currRoute = ""
                            
                            viewModel.roName = ""
                            viewModel.roCountry = ""
                            viewModel.roLoc = ""
                            
                            viewModel.roSDate = ""
                            viewModel.roFDate = ""
                            
                            viewModel.fetchRoutes()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save route")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(13)
                                .padding(.horizontal, 5)
                                .background(RoundedRectangle(cornerRadius: 6).fill(Color("prim")))
                        })
                        .opacity(viewModel.currRoute.isEmpty || viewModel.currColor.isEmpty || viewModel.roName.isEmpty || viewModel.roLoc.isEmpty || viewModel.roMType.isEmpty || viewModel.roSDate.isEmpty || viewModel.roFDate.isEmpty ? 0.4 : 1)
                        .disabled(viewModel.currRoute.isEmpty || viewModel.currColor.isEmpty || viewModel.roName.isEmpty || viewModel.roLoc.isEmpty || viewModel.roMType.isEmpty || viewModel.roSDate.isEmpty || viewModel.roFDate.isEmpty ? true : false)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddRoute(viewModel: RoutesViewModel())
}
