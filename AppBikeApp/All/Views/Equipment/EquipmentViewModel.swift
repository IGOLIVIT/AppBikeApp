//
//  EquipmentViewModel.swift
//  AppBikeApp
//
//  Created by IGOR on 26/12/2024.
//

import SwiftUI
import CoreData

final class EquipmentViewModel: ObservableObject {

    @AppStorage("types") var types: [String] = ["Long trip", "Track day", "City rides"]
    @Published var currType = ""
    @Published var typeFilter = "All"
    @Published var addingTag: String = ""
    
    @Published var colors: [String] = ["prim2", "prim3", "prim4"]
    @Published var currColor = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddTag: Bool = false
    
    @Published var eh: Int = 0
    @Published var en: Int = 0
    @Published var th: Int = 0
    @Published var tn: Int = 0
    @Published var ph: Int = 0
    @Published var pn: Int = 0

    @Published var eqType: String = ""
    @Published var eqName: String = ""
    @Published var eqEq: String = ""
    @Published var eqHave: String = ""
    @Published var eqNeed: String = ""
    @Published var eqTools: String = ""
    @Published var eqTHave: String = ""
    @Published var eqTNeed: String = ""
    @Published var eqPart: String = ""
    @Published var eqPHave: String = ""
    @Published var eqPNeed: String = ""

    @Published var equipts: [EquipModel] = []
    @Published var selectedEquip: EquipModel?

    func addEquip() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "EquipModel", into: context) as! EquipModel

        loan.eqType = eqType
        loan.eqName = eqName
        loan.eqEq = eqEq
        loan.eqHave = eqHave
        loan.eqNeed = eqNeed
        loan.eqTools = eqTools
        loan.eqTHave = eqTHave
        loan.eqTNeed = eqTNeed
        loan.eqPart = eqPart
        loan.eqPHave = eqPHave
        loan.eqPNeed = eqPNeed

        CoreDataStack.shared.saveContext()
    }

    func fetchEquips() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<EquipModel>(entityName: "EquipModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.equipts = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.equipts = []
        }
    }
 
}
