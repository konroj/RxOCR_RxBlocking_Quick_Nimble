//
//  TextRecognitionProtocol.swift
//  OCReact
//
//  Created by Konrad Roj on 18/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import RxSwift

protocol TextRecognition {
    func performRecognition(with image: UIImage) -> Single<Scan>
}
