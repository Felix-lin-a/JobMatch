//
//  JobMatchTests.swift
//  JobMatchTests
//
//  Created by Tianqi Li's Macbook pro on 6/9/2026.
//

import XCTest
@testable import JobMatch

final class JobMatchTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMatchJob() throws {
        let useCase = MatchJobUseCase()
        
        let result = try useCase.execute(
            job: sampleJob1,
            student: sampleStudent
        )
        
        XCTAssertEqual(result.score,70)
    }
    
    func testNoMatchJob() throws {
        let useCase = MatchJobUseCase()
        
        let result = try useCase.execute(
            job: sampleJob3,
            student: sampleStudent
        )
        
        XCTAssertEqual(result.score,0)
    }

    func testPartialMatchJob() throws {
        let useCase = MatchJobUseCase()
        
        let result = try useCase.execute(
            job: sampleJob2,
            student: sampleStudent
        )
        
        XCTAssertEqual(result.score,30)
    }
    
    func testMissingSkillsError() throws {
        let student = StudentProfile(
            name: "Alex",
            skills: [],
            availableDays: ["Monday"],
            preferredLocation: "Sydney CBD"
            )
        
        let useCase = MatchJobUseCase()
        
        XCTAssertThrowsError(
            try useCase.execute(
            job: sampleJob1,
            student: student
        )
        ){error in
            XCTAssertTrue(error is MatchJobError)
        }
    }
    
    func testSaveJob() throws {
        let useCase = SaveJobUseCase()
        
        let result = try useCase.execute(
            job: sampleJob1
            , savedJobs: [])
        
        XCTAssertEqual(result.count,1)
    }
    
    func testSaveJobAlreadySavedError() throws {
        let useCase = SaveJobUseCase()
        
        XCTAssertThrowsError(
            try useCase.execute(
                job: sampleJob1,
                savedJobs: [sampleJob1])
        ){error in
            XCTAssertTrue(error is SaveJobUseCaseError)
        }
    }
    
    func testUpdateStudentProfile() throws {
        let useCase = UpdateStudentProfileUseCase()
        
        let result = try useCase.execute(
            name: "Alex",
            skills: ["Communication","IT Support"],
            availableDays: ["Monday", "Wednesday"],
            preferredLocation: "Sydney CBD"
        )
        
        XCTAssertEqual(result.name, "Alex")
        XCTAssertEqual(result.skills.count, 2)
    }
    
    func testUpdateStudentProfileMissingNameError() throws {

        let useCase = UpdateStudentProfileUseCase()

        XCTAssertThrowsError(
            try useCase.execute(
                name: "",
                skills: ["Communication"],
                availableDays: ["Monday"],
                preferredLocation: "Sydney CBD"
            )
        ) { error in

            XCTAssertEqual(
                error as? UpdateStudentProfileUseCaseError,
                .missingName
            )
        }
    }
    
    func testUpdateStudentProfileMissingSkillsError() throws {

        let useCase = UpdateStudentProfileUseCase()

        XCTAssertThrowsError(
            try useCase.execute(
                name: "Alex",
                skills: [],
                availableDays: ["Monday"],
                preferredLocation: "Sydney CBD"
            )
        ) { error in

            XCTAssertEqual(
                error as? UpdateStudentProfileUseCaseError,
                .missingSkills
            )
        }
    }
}
