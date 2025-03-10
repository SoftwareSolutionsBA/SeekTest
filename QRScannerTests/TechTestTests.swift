//
//  TechTestTests.swift
//  TechTestTests
//
//  Created by David Figueroa on 26/02/25.
//

import XCTest
@testable import TechTest

final class TechTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetPosts() throws {
        let sut = ContentViewModel(getPostsUseCase: GetPostsUseCaseMock())
        let posts = sut.fetchPosts()
        print(posts)
        XCTAssertTrue(sut.posts.isEmpty)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
