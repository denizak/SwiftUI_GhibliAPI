//
//  GhibliApiTest.swift
//  ghibliappTests
//
//  Created by Deni Zakya on 13/07/19.
//  Copyright © 2019 Deni Zakya. All rights reserved.
//

import XCTest
import Combine
@testable import ghibliapp

class GhibliApiTest: XCTestCase {

    func testGetMovies() {
        let expectApi = expectation(description: "get movies")
        let ghibliApi = GhibliApiFactory.create()
    
        let cancellable = ghibliApi.getMovies()
            .catch { error -> Just<[Movie]> in
                print("\(error)")
                assertionFailure("Error decode")
                return Just([])
            }
            .sink(receiveValue: { movies in
                expectApi.fulfill()
                XCTAssertGreaterThan(movies.count, 0)
            })
        
        waitForExpectations(timeout: 5, handler: nil)
        
        cancellable.cancel()
    }

}
