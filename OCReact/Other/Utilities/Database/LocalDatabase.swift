//
//  LocalDatabase.swift
//  OCReact
//
//  Created by Konrad Roj on 18/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import RxSwift

/* Additional configuration layer */
class LocalDatabase {
    private let database: Database
    
    init(database: Database) {
        self.database = database
    }
    
}

extension LocalDatabase: Database {
    
    func save(item: Scan) -> Completable {
        return database.save(item: item)
    }
    
    func delete(item: Scan) -> Completable {
        return database.delete(item: item)
    }
    
    func clear() -> Completable {
        return database.clear()
    }
    
    var items: Observable<[Scan]> {
        return database.items
    }
    
    
}
