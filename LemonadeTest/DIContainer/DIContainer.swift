//
//  DIContainer.swift
//  LemonadeTest
//
//  Created by Abdullah on 30/06/2022.
//

import Foundation

class DIContainer {
    
    static func makeLandingVC() -> LandingController {
        let studentRepository = StudentRepository(remoteDataSource: RemoteDataSource(), localDataSource: LocalDataSource.shared)
        let viewModel = LandingViewModel(studentRepository: studentRepository)
        let landingVC = LandingController(view: LandingView())
        landingVC.viewModel = viewModel
        return landingVC
    }
}
