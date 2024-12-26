//
//  RoutesViewModel.swift
//  AppBikeApp
//
//  Created by IGOR on 25/12/2024.
//

import SwiftUI
import CoreData

final class RoutesViewModel: ObservableObject {

    @Published var typesRoute: [String] = ["One-way trip", "Multi-stop route", "Tracks", "Off-road"]
    @Published var currRoute = ""
    @Published var routeFilter = "All"
    
    @Published var colors: [String] = ["prim2", "prim3", "prim4"]
    @Published var currColor = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var PC: Int = 0

    @Published var roType: String = ""
    @Published var roCountry: String = ""
    @Published var roColor: String = ""
    @Published var roName: String = ""
    @Published var roLoc: String = ""
    @Published var roMType: String = ""
    @Published var roPart: String = ""
    @Published var roSDate: String = ""
    @Published var roFDate: String = ""

    @Published var routes: [RoutModel] = []
    @Published var selectedRoute: RoutModel?

    func addRoute() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "RoutModel", into: context) as! RoutModel

        loan.roType = roType
        loan.roCountry = roCountry
        loan.roColor = roColor
        loan.roName = roName
        loan.roLoc = roLoc
        loan.roMType = roMType
        loan.roPart = roPart
        loan.roSDate = roSDate
        loan.roFDate = roFDate

        CoreDataStack.shared.saveContext()
    }

    func fetchRoutes() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<RoutModel>(entityName: "RoutModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.routes = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.routes = []
        }
    }
 
}
