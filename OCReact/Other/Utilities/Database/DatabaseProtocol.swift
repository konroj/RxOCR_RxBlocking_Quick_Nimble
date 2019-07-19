//
//  DatabaseProtocol.swift
//  OCReact
//
//  Created by Konrad Roj on 18/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import RxSwift

protocol Database {
    func save(item: Scan) -> Completable
    func delete(item: Scan) -> Completable
    func clear() -> Completable
    
    var items: Observable<[Scan]> { get }
}
