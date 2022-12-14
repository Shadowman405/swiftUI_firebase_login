//
//  DataManager.swift
//  swiftUI_firebase_login
//
//  Created by Maxim Mitin on 9.09.22.
//

import SwiftUI
import Firebase


class DataManager: ObservableObject {
    @Published var dogs: [Dog] = []
    
    init(){
        fetchDogs()
    }
    
    func fetchDogs() {
        dogs.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Dogs")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let breed = data["breed"] as? String ?? ""
                    
                    let dog = Dog(id: id, Breed: breed)
                    self.dogs.append(dog)
                }
            }
        }
    }
    
    func addDog(dogBreed: String) {
        let db = Firestore.firestore()
        let ref = db.collection("Dogs").document(dogBreed)
        ref.setData(["breed": dogBreed, "id": Int.random(in: 6..<10000)]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
