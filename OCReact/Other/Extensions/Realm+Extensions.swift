//
//  Realm+Extensions.swift
//  OCReact
//
//  Created by Konrad Roj on 19/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import RxSwift
import RxRealm
import RealmSwift

extension Realm: Database {
    
    func save(item: Scan) -> Completable {
        do {
            try write {
                add(ScanModel(with: item))
            }
            return Completable.empty()
        } catch let error {
            return Completable.error(error)
        }
    }
    
    func delete(item: Scan) -> Completable {
        do {
            try write {
                delete(ScanModel(with: item))
            }
            return Completable.empty()
        } catch let error {
            return Completable.error(error)
        }
    }
    
    func clear() -> Completable {
        do {
            try write {
                deleteAll()
            }
            return Completable.empty()
        } catch let error {
            return Completable.error(error)
        }
    }
    
    var items: Observable<[Scan]> {
        let models = objects(ScanModel.self)
        return Observable.changeset(from: models)
            .map({ Array($0.0).map({ Scan(with: $0) }) })
    }
    
}
