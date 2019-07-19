//
//  OCReactTests.swift
//  OCReactTests
//
//  Created by Konrad Roj on 18/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import RxSwift
import RxBlocking
import Quick
import Nimble
@testable import OCReact

/* we should test all possible scenarios, here's only one */
class BloodPressureSpec: QuickSpec {
    
    override func spec() {
        var viewModel: ScanListViewModel!
        
        beforeEach {
            viewModel = ScanListViewModel(database: MockService.database, textRecognition: MockService.textRecognition)
        }
        
        describe("observing") {
            context("items") {
                it("should return items (1) saved in database") {
                    do {
                        let item = try viewModel.items.toBlocking().first()
                        expect(item?.first?.text).to(be("test"))
                    } catch {
                        fail()
                    }
                }
            }
        }
        
        describe("calling") {
            context("add:image") {
                it("should should add recognized scan to database") {
                    do {
                        let success = try viewModel.add(image: UIImage())
                            .andThen(Observable.just("success")).toBlocking().first()
                        expect(success).to(be("success"))
                    } catch {
                        fail()
                    }
                }
            }
        }
    }
    
}
