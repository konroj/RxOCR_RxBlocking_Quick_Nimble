//
//  DatabaseService.swift
//  OCReact
//
//  Created by Konrad Roj on 18/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import RxSwift
import RxRealm

final class DatabaseService {
    private let database: Database
    
    init(with utility: Database) {
        self.database = utility
    }
    
    var items: Observable<[Scan]> {
        return database.items
    }
    
    func add(scan: Scan) -> Completable {
        return database.save(item: scan)
    }
    
    func remove(scan: Scan) -> Completable {
        return database.delete(item: scan)
    }
    
    func clear() -> Completable {
        return database.clear()
    }
    
}
