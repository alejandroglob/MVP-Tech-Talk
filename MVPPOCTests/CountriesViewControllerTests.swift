//
//  CountriesViewControllerTests.swift
//  MVPPOC
//
//  Created by Alejandro Rodriguez on 8/17/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

@testable import MVPPOC
import XCTest

class CountriesViewControllerTests: XCTestCase {

    var sut: CountriesViewController!
    var window: UIWindow!

    override func setUp() {
        super.setUp()

        window = UIWindow()
        setupCountriesViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // MARK: - Test setup

    func setupCountriesViewController()
    {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "CountriesViewController") as! CountriesViewController
    }

    func loadView()
    {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    func testFetchCountries() {

        //Given
        let presenterSpy = CountriesPresenterSpy()
        sut.presenter = presenterSpy

        //When 
        loadView()

        //Then
        XCTAssertTrue(presenterSpy.fetchCountriesWasCalled)
    }

}

class CountriesPresenterSpy: CountriesPresenterProtocol {

    weak var view: CountriesViewProtocol?
    var fetchCountriesWasCalled = false

    func fetchCountries() {
        fetchCountriesWasCalled = true
    }

    func country(at indexPath: IndexPath) -> (String, String) {
        return ("", "")
    }

    func countriesCount() -> Int {
        return 0
    }
}
