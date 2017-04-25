//
//  Parser.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 25/04/2017.
//  Copyright © 2017 Nikos Xenakis. All rights reserved.
//

import Foundation
import SpriteKit

final class Parser{
    
    var url: URL?
    var data: Data?
    var json: Any?
    
    static let shared: Parser = Parser()

    private init(){
        
    }

    public static func initialization(fileName: String, ext: String){
        print("Initializing Parser")
        
        // Fetch URL
        Parser.shared.url = Bundle.main.url(forResource: fileName, withExtension: ext)!
        
        // Load Data
        Parser.shared.data = try! Data(contentsOf: shared.url!)
        
        // Deserialize JSON
        Parser.shared.json = try! JSONSerialization.jsonObject(with: shared.data!, options: [])
        
    }
  
    public static func printData(){
        print(Parser.shared.json)
    }

    public static func setProperties(){
        
        if let dictionary = Parser.shared.json as? [String: Any] {
            
            for (key, value) in dictionary {
                print(key,value)

            }
        }
    }

}


