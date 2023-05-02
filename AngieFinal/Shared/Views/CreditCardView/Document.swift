//
//  Document.swift
//  Finance App Dark Theme
//
//  Created by Angie Kim on 5/1/23.
//  (Original Code by John Henri Thompson)
//

import Foundation

//
//  Model.swift
//


class Document: ObservableObject {
    @Published var items:[ItemModel]
    init() {
        print("Model init")
        // items for testing
        items = [
             ItemModel(label:"Visa Devit", assetName: "1234123311222221", systemName: "11/25"),
             ItemModel(label:"Visa Credit", assetName: "1234123311222221", systemName: "11/25"),
             ItemModel(label:"AMEX Credit", assetName: "1234123311222221", systemName: "11/25")
        ]
    }
    
    func addItem(label:String, assetName:String, systemName: String) -> ItemModel {
        let item = ItemModel(label:label, assetName: assetName, systemName: systemName)
        items.append(item)
        return item
    }
    
    func newItem() -> ItemModel {
        return addItem(label: "", assetName: "", systemName: "")
    }
    
    func updateItem(id: UUID, label:String, assetName:String, systemName: String) {
        if let index = findIndex(id) {
            items[index].label = label
            items[index].assetName = assetName
            items[index].systemName = systemName
        }
    }
    
    func deleteItem(id: UUID) {
        if let index = findIndex(id) {
            items.remove(at: index)
        }
    }
    
    func findIndex(_ id: UUID) -> Int? {
        return items.firstIndex { item in item.id == id }
    }
}
