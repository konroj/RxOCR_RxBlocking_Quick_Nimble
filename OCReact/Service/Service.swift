//
//  Service.swift
//  OCReact
//
//  Created by Konrad Roj on 18/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import Foundation
import SwiftyTesseract
import RealmSwift

/* Fabric of services */
final class Service {
    
    class var textRecognition: TextRecognitionService {
        let swiftTesseract = SwiftyTesseract(languages: [/*.polish,*/ .english])
        // uses tessdata_fast files, better effects with slower models
        let tessereact = Tessereact(recognizer: swiftTesseract)
        return TextRecognitionService(with: tessereact)
    }
    
    class var database: DatabaseService {
        let realm = try! Realm() // should handle exceptions
        let database = LocalDatabase(database: realm)
        return DatabaseService(with: database)
    }
    
}
