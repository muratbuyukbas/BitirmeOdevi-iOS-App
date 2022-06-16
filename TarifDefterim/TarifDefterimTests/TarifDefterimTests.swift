//
//  TarifDefterimTests.swift
//  TarifDefterimTests
//
//  Created by Murat Büyükbaş on 5/3/22.
//

import XCTest

class TarifDefterimTests: XCTestCase {

    func testNotificationIDCreation() {
        let first = "123_abc"
        let second = "456_def"
        XCTAssertNotEqual(first, second)
    }

//    func testNotificationIDCreationFailure() {
//        let first = "123_abc"
//        let second = "456_def"
//        XCTAssertEqual(first, second)
//    }

}
