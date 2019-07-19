//
//  RecognitionError.swift
//  OCReact
//
//  Created by Konrad Roj on 18/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import UIKit

enum RecognitionError: Error {
    case noText(UIImage) // Returns UIImage for possible further handling
}
