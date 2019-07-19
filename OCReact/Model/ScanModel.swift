//
//  ScanModel.swift
//  OCReact
//
//  Created by Konrad Roj on 18/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import RealmSwift

class ScanModel: Object, ScanModelProtocol {
    @objc dynamic var text = ""
    @objc dynamic var imageData: Data = Data()
    
    convenience init(with scan: Scan) {
        self.init()
        self.text = scan.text
        guard let imageData = scan.image.pngData()
            else { fatalError() } // needs better error handling
        self.imageData = imageData
    }
    
}
