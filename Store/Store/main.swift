//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String { get }
    func price() -> Int
}

class Item: SKU {
    let name: String
    let priceEach: Int
    
    init(name: String, priceEach: Int) {
        self.name = name
        self.priceEach = priceEach
    }
    
    func price() -> Int {
        return priceEach
    }
}

class Receipt {
    var scannedItems: [SKU]
    
    init() {
        scannedItems = []
    }
    
    func add(_ item: SKU) {
        scannedItems.append(item)
    }
    
    func output() -> String {
        var receiptText = "Receipt:\n"
        for item in scannedItems {
            receiptText += "\(item.name): $\(String(format: "%.2f", Double(item.price()) / 100))\n"
        }
        receiptText += "------------------\n"
        receiptText += "TOTAL: $\(String(format: "%.2f", Double(total()) / 100))"
        return receiptText
    }
    
    
    
    func total() -> Double {
        return Double(scannedItems.reduce(0) {$0 + $1.price()})
    }
    
    func items() -> [SKU] {
        return scannedItems
    }
}


class Register {
    var receipt: Receipt
    
    init() {
        self.receipt = Receipt()
    }
    
    func scan(_ item: SKU) {
        receipt.add(item)
        print("Scanned item: \(item.name), Price: \(item.price())")
    }
    
    func subtotal() -> Double {
        return receipt.total()
    }
    
    func total() -> Receipt {
        let finalReceipt = receipt
        receipt = Receipt()
        return finalReceipt
    }
    
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

