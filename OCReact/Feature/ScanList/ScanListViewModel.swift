//
//  ScanListViewModel.swift
//  OCReact
//
//  Created by Konrad Roj on 18/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import UIKit
import RxSwift

enum ScanListError: Error {
    case imageSaveFailed
}

final class ScanListViewModel {
    private let database: DatabaseService
    private let textRecognition: TextRecognitionService
    
    init(database: DatabaseService, textRecognition: TextRecognitionService) {
        self.database = database
        self.textRecognition = textRecognition
    }
    
    /* probably should consider some kind of pagination here */
    var items: Observable<[Scan]> {
        return database.items
    }
    
    func add(image: UIImage) -> Completable {
        return textRecognition
        .performRecognition(with: image)
        .subscribeOn(SerialDispatchQueueScheduler(qos: .background))
        .observeOn(MainScheduler.instance)
        .flatMapCompletable { [weak self] (scan) -> Completable in
            guard let self = self else {
                return Completable.error(ScanListError.imageSaveFailed)
            }
            return self.database.add(scan: scan)
        }
    }
    
}
