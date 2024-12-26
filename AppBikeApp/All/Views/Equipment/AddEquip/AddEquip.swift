//
//  AddEquip.swift
//  AppBikeApp
//
//  Created by IGOR on 26/12/2024.
//

import SwiftUI

struct AddEquip: View {

    @StateObject var viewModel: EquipmentViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New list")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.currType = ""
                            
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
                                
                                ForEach(viewModel.types, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currType = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(viewModel.currType == index ? .black : .white)
                                            .font(.system(size: 14, weight: .regular))
                                            .padding(8)
                                            .padding(.horizontal, 5)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(viewModel.currType == index ? Color("prim") : .white.opacity(0.1)))
                                    })
                                }
                            }
                        }
                        .padding(.bottom, 30)

                        Text("List name")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter list name")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.eqName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.eqName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        
                        Text("Equipment")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter equipment name")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.eqEq.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.eqEq)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding(8)
                        .frame(maxWidth: .infinity)

                        HStack {
                            
                            VStack {
                                
                                Text("Equipment have")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack(content: {
                                    
                                    Text("0")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.eqHave.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.eqHave)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding(8)
                                .frame(maxWidth: .infinity)
                            }
                            
                            VStack {
                                
                                Text("Equipment need")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                ZStack(content: {
                                    
                                    Text("0")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.eqNeed.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.eqNeed)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding(8)
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Tools")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter tool name")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.eqTools.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.eqTools)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding(8)
                        .frame(maxWidth: .infinity)

                        HStack {
                            
                            VStack {
                                
                                Text("Tools have")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack(content: {
                                    
                                    Text("0")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.eqTHave.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.eqTHave)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding(8)
                                .frame(maxWidth: .infinity)
                            }
                            
                            VStack {
                                
                                Text("Tools need")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                ZStack(content: {
                                    
                                    Text("0")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.eqTNeed.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.eqTNeed)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding(8)
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Participants")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.eqPart.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.eqPart)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding(8)
                        .frame(maxWidth: .infinity)

                        HStack {
                            
                            VStack {
                                
                                Text("Participants have")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack(content: {
                                    
                                    Text("0")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.eqPHave.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.eqPHave)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding(8)
                                .frame(maxWidth: .infinity)
                            }
                            
                            VStack {
                                
                                Text("Participants need")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                ZStack(content: {
                                    
                                    Text("0")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.eqPNeed.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.eqPNeed)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding(8)
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.bottom, 35)
                        
                        Button(action: {
                            
                            viewModel.eh += Int(viewModel.eqHave) ?? 0
                            viewModel.en += Int(viewModel.eqNeed) ?? 0
                            viewModel.th += Int(viewModel.eqTHave) ?? 0
                            viewModel.tn += Int(viewModel.eqTNeed) ?? 0
                            viewModel.ph += Int(viewModel.eqPHave) ?? 0
                            viewModel.pn += Int(viewModel.eqPNeed) ?? 0

                            viewModel.eqType = viewModel.currType
                            
                            viewModel.addEquip()
                            
                            viewModel.eqEq = ""
                            viewModel.eqName = ""
                            viewModel.eqHave = ""
                            viewModel.eqNeed = ""
                            viewModel.eqTHave = ""
                            viewModel.eqTNeed = ""
                            viewModel.eqPHave = ""
                            viewModel.eqPNeed = ""
                            viewModel.currType = ""
                            
                            viewModel.fetchEquips()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save list")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(13)
                                .padding(.horizontal, 5)
                                .background(RoundedRectangle(cornerRadius: 6).fill(Color("prim")))
                        })
                        .opacity(viewModel.currType.isEmpty || viewModel.eqName.isEmpty || viewModel.eqEq.isEmpty || viewModel.eqHave.isEmpty || viewModel.eqNeed.isEmpty || viewModel.eqTools.isEmpty || viewModel.eqTHave.isEmpty || viewModel.eqTNeed.isEmpty || viewModel.eqPHave.isEmpty || viewModel.eqPNeed.isEmpty ? 0.4 : 1)
                        .disabled(viewModel.currType.isEmpty || viewModel.eqName.isEmpty || viewModel.eqEq.isEmpty || viewModel.eqHave.isEmpty || viewModel.eqNeed.isEmpty || viewModel.eqTools.isEmpty || viewModel.eqTHave.isEmpty || viewModel.eqTNeed.isEmpty || viewModel.eqPHave.isEmpty || viewModel.eqPNeed.isEmpty ? true : false)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddEquip(viewModel: EquipmentViewModel())
}
