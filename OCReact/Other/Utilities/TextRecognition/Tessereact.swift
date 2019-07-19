//
//  Tessereact.swift
//  OCReact
//
//  Created by Konrad Roj on 18/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import RxSwift

/* So fancy reactive name. */ /* Additional configuration layer */
final class Tessereact {
    private let recognizer: TextRecognition
    
    init(recognizer: TextRecognition) {
        self.recognizer = recognizer
    }
    
}

extension Tessereact: TextRecognition {
    
    func performRecognition(with image: UIImage) -> Single<Scan> {
        return recognizer.performRecognition(with: image)
    }
    
}
