//
//  GetPostsUseCaseMock.swift
//  TechTest
//
//  Created by David Figueroa on 26/02/25.
//

@testable import TechTest

struct GetPostsUseCaseMock: GetPostsUseCaseContract {
    func getPosts() async -> [TechTest.Post] {
        return [Post(title: "1", body: "2"),
                Post(title: "2", body: "3")]
    }
}
