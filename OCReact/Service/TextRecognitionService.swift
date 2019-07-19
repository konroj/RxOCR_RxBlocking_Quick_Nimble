//
//  TextRecognitionService.swift
//  OCReact
//
//  Created by Konrad Roj on 18/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import UIKit
import RxSwift

final class TextRecognitionService {
    private let recognizer: TextRecognition
    
    init(with utility: TextRecognition) {
        self.recognizer = utility
    }
    
    func performRecognition(with image: UIImage) -> Single<Scan> {
        return self.recognizer.performRecognition(with: image)
    }
    
}
