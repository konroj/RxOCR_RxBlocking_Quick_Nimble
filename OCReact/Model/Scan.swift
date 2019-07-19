//
//  Scan.swift
//  OCReact
//
//  Created by Konrad Roj on 18/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import UIKit

/*
   Abstraction is used between External Frameworks models and in-app models only.
 */
struct Scan {
    let image: UIImage
    let text: String
}

extension Scan {
    
    init(with model: ScanModelProtocol) {
        guard let image = UIImage(data: model.imageData)
            else { fatalError() } // needs better error handling
        self.image = image
        self.text = model.text
    }
    
}
