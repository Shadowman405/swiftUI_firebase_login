//
//  ListView.swift
//  swiftUI_firebase_login
//
//  Created by Maxim Mitin on 9.09.22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationView {
            List(dataManager.dogs, id: \.id) { dog in
                Text(dog.Breed)
            }
            .navigationTitle("Dogs")
            .navigationBarItems(trailing: Button(action: {
                // add
            }, label: {
                Image(systemName: "plus")
            }))
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DataManager())
    }
}
