//
//  EquipDetail.swift
//  AppBikeApp
//
//  Created by IGOR on 26/12/2024.
//

import SwiftUI

struct EquipDetail: View {
    
    @StateObject var viewModel: EquipmentViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedEquip?.eqName ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDetail = false
                            }
                            
                        }, label: {
                            
                            Text("Close")
                                .foregroundColor(Color("prim"))
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
                    
                    VStack(spacing: 14) {
                        
                        Text("Equipment")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedEquip?.eqEq ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Equipment: Have / Need")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(viewModel.selectedEquip?.eqHave ?? "")/\(viewModel.selectedEquip?.eqNeed ?? "")")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Rectangle()
                            .fill(.white.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        Text("Tools")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedEquip?.eqTools ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Tools: Have / Need")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(viewModel.selectedEquip?.eqTHave ?? "")/\(viewModel.selectedEquip?.eqTNeed ?? "")")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Rectangle()
                            .fill(.white.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        Text("Participants")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedEquip?.eqPart ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Participants: Have / Need")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(viewModel.selectedEquip?.eqPHave ?? "")/\(viewModel.selectedEquip?.eqPNeed ?? "")")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Rectangle()
                            .fill(.white.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
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
                            
                            CoreDataStack.shared.deleteEquip(withEqName: viewModel.selectedEquip?.eqName ?? "", completion: {
                                
                                viewModel.fetchEquips()
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
    EquipDetail(viewModel: EquipmentViewModel())
}
