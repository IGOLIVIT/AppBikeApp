//
//  StartViewModel.swift
//  AppBikeApp
//
//  Created by IGOR on 25/12/2024.
//

import SwiftUI
import CoreData

final class StartViewModel: ObservableObject {
    
    @AppStorage("status") var status: Bool = false
    
    @AppStorage("make") var make: String = ""
    @Published var addMake: String = ""

    @AppStorage("Model") var Model: String = ""
    @Published var addModel: String = ""
    
    @AppStorage("mileage") var mileage: String = ""
    @Published var addMileage: String = ""
    
    @AppStorage("yearRelease") var yearRelease: String = ""
    @Published var addYear: String = ""
    
    @Published var typesMoto: [String] = ["Vintage", "Sport", "Off-road", "Urban"]
    @Published var currMoto = ""
    @AppStorage("motoType") var motoType: String = ""
}
