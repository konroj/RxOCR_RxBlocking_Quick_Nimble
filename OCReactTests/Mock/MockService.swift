//
//  MockService.swift
//  OCReactTests
//
//  Created by Konrad Roj on 18/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

@testable import OCReact

/* Fabric of mocked services */
class MockService {
    
    /* As we do not want to test Realm and SwiftyTesseract we create "always success" mocks for them
       which are returning empty UIImage() and recognized "test" text.
     */
    
    class var textRecognition: TextRecognitionService {
        let mockTessereact = MockTessereact()
        let tessereact = Tessereact(recognizer: mockTessereact)
        return TextRecognitionService(with: tessereact)
    }
    
    class var database: DatabaseService {
        let mockLocalDatabase = MockDatabase()
        let database = LocalDatabase(database: mockLocalDatabase)
        return DatabaseService(with: database)
    }
    
}
