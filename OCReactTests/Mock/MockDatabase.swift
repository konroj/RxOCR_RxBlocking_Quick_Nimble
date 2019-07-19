//
//  MockDatabase.swift
//  OCReactTests
//
//  Created by Konrad Roj on 19/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import RxSwift
@testable import OCReact

class MockDatabase: Database {
    
    func save(item: Scan) -> Completable {
        return Completable.empty()
    }
    
    func delete(item: Scan) -> Completable {
        return Completable.empty()
    }
    
    func clear() -> Completable {
        return Completable.empty()
    }
    
    var items: Observable<[Scan]> {
        return Observable.just([Scan(image: UIImage(), text: "test")])
    }
    
    
}
