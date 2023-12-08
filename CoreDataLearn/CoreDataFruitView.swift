//
//  CoreDataFruitView.swift
//  CoreDataLearn
//
//  Created by donghyeon choi on 12/8/23.
//

import SwiftUI
import CoreData

class CoreDataFruitViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntites: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        } 
        
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        do {
            savedEntites = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving Data. \(error)")
        }
    }
    
}

struct CoreDataFruitView: View {
    var body: some View {
        VStack {
            TextField(title: )
        }
    }
}

#Preview {
    CoreDataFruitView()
}
