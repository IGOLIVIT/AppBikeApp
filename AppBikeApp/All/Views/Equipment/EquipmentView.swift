//
//  EquipmentView.swift
//  AppBikeApp
//
//  Created by IGOR on 25/12/2024.
//

import SwiftUI

struct EquipmentView: View {

    @StateObject var viewModel = EquipmentViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Equipment")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                if viewModel.equipts.isEmpty {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("No data")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 12) {
                                
                                Text("Equipment")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Text("0/0")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 19, weight: .bold))
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 12) {
                                
                                Text("Tools")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Text("0/0")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 19, weight: .bold))
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 12) {
                                
                                Text("Participants")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Text("0/0")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 19, weight: .bold))
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                    .padding(.bottom)
                    
                } else {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("In Progress")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 12) {
                                
                                Text("Equipment")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Text("\(viewModel.eh)/\(viewModel.en)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 19, weight: .bold))
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 12) {
                                
                                Text("Tools")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Text("\(viewModel.th)/\(viewModel.tn)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 19, weight: .bold))
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 12) {
                                
                                Text("Participants")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Text("\(viewModel.ph)/\(viewModel.pn)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 19, weight: .bold))
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                    .padding(.bottom)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.typeFilter = "All"
                            
                        }, label: {
                            
                            Text("All")
                                .foregroundColor(viewModel.typeFilter == "All" ? .black : .white)
                                .font(.system(size: 14, weight: .regular))
                                .padding(8)
                                .padding(.horizontal, 5)
                                .background(RoundedRectangle(cornerRadius: 5).fill(viewModel.typeFilter == "All" ? Color("prim") : .white.opacity(0.1)))
                        })
                        
                        ForEach(viewModel.types, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.typeFilter = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(viewModel.typeFilter == index ? .black : .white)
                                    .font(.system(size: 14, weight: .regular))
                                    .padding(8)
                                    .padding(.horizontal, 5)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(viewModel.typeFilter == index ? Color("prim") : .white.opacity(0.1)))
                            })
                        }
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddTag = true
                            }
                            
                        }, label: {
                            
                            Text("+")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .padding(8)
                                .padding(.horizontal, 5)
                                .background(RoundedRectangle(cornerRadius: 5).fill(.white.opacity(0.1)))
                        })
                    }
                }
                .padding(.bottom, 30)
                
                if viewModel.equipts.isEmpty {
                    
                    VStack(spacing: 20) {
                        
                        Image("empty2")
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
                    
                    if viewModel.typeFilter == "All" {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isAdd = true
                                    }
                                    
                                }, label: {
                                    
                                    Text("New list +")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 35)
                                        .background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.2)))
                                })
                                .padding(.bottom, 5)
                                
                                ForEach(viewModel.equipts, id: \.self) { index in
                                
                                    VStack(alignment: .leading, spacing: 16) {
                                        
                                        Text(index.eqName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .medium))
                                        
                                        HStack {
                                            
                                            Text(index.eqType ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(4)
                                                .padding(.horizontal, 4)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                                            
                                            Text("Complete: \(index.eqHave ?? "") - \(index.eqNeed ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                        }
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedEquip = index
                                            
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
                                    .background(RoundedRectangle(cornerRadius: 15).fill((index.eqHave ?? "") == (index.eqNeed ?? "") ? Color("prim4") : Color("bg2")))
                                }
                            }
                        }
                        
                    } else {
                        
                        if viewModel.equipts.filter({($0.eqType ?? "") == viewModel.typeFilter}).isEmpty {
                            
                            Text("Empty")
                                .foregroundColor(.white)
                                .font(.system(size: 26, weight: .semibold))
                                .padding(.top)
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = true
                                }
                                
                            }, label: {
                                
                                Text("Add list +")
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
                                    
                                    Text("New list +")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 35)
                                        .background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.2)))
                                })
                                .padding(.bottom, 5)
                                
                                ForEach(viewModel.equipts.filter{($0.eqType ?? "") == viewModel.typeFilter}, id: \.self) { index in
                                    
                                    VStack(alignment: .leading, spacing: 16) {
                                        
                                        Text(index.eqName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .medium))
                                        
                                        HStack {
                                            
                                            Text(index.eqType ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(4)
                                                .padding(.horizontal, 4)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                                            
                                            Text("\(index.eqHave ?? "") /\(index.eqNeed ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                        }
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedEquip = index
                                            
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
                                    .background(RoundedRectangle(cornerRadius: 15).fill((index.eqHave ?? "") == (index.eqNeed ?? "") ? Color("prim4") : Color("bg2")))
                                }
                            }
                        }
                    }
                    }

                    
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddEquip(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchEquips()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddTag ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddTag = false
                        }
                    }
                
                VStack(spacing: 19) {

                    Text("Adding a tag")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                    
                    ZStack(content: {
                        
                        Text("Tag name")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addingTag.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addingTag)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .regular))
                        
                    })
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 6).fill(.black))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.addingTag = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddTag = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.types.append(viewModel.addingTag)
                            viewModel.addingTag = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddTag = false
                            }
                            
                        }, label: {
                            
                            Text("Add tag")
                                .foregroundColor(.blue)
                                .font(.system(size: 17, weight: .semibold))
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
                .offset(y: viewModel.isAddTag ? 0 : UIScreen.main.bounds.height)
            }
        )
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            EquipDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    EquipmentView()
}
