//
//  MockTessereact.swift
//  OCReactTests
//
//  Created by Konrad Roj on 19/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import UIKit
import RxSwift
@testable import OCReact

final class MockTessereact: TextRecognition {
    
    func performRecognition(with image: UIImage) -> Single<Scan> {
        return Single.just(Scan(image: UIImage(), text: "test"))
    }
    
}
