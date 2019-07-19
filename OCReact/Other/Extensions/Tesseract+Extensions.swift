//
//  Tesseract+Extensions.swift
//  OCReact
//
//  Created by Konrad Roj on 19/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import RxSwift
import SwiftyTesseract

extension SwiftyTesseract: TextRecognition {
    
    func performRecognition(with image: UIImage) -> Single<Scan> {
        return Single.create { [weak self] single in
            self?.performOCR(on: image) { (text) in
                if let text = text {
                    single(.success(Scan(image: image, text: text)))
                }
                single(.error(RecognitionError.noText(image)))
            }
            return Disposables.create()
        }
    }
    
}
