//
//  PortaCovidUITests.swift
//  PortaCovidUITests
//
//  Created by Andrés Pizá Bückmann on 6/12/21.
//

import XCTest

class PortaCovidUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        continueAfterFailure = false
        setupSnapshot(app)
    }

    func testWithQR() throws {
        app.launchArguments += ["-preloadQR"]
        app.launch()

        snapshot("01QR")
    }

    func testNoQR() throws {
        app.launchArguments += ["-noQR"]
        app.launch()

        snapshot("02NoQRt")
    }
}
