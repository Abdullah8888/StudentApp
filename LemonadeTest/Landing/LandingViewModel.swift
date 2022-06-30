//
//  LandingViewModel.swift
//  LemonadeTest
//
//  Created by Abdullah on 30/06/2022.
//

import Foundation


enum FetchStudentStatus {
    case didFetchStudents([Student])
    case didFetchStudentsFail(String?)
}

class LandingViewModel {
    
    let studentRepository: StudentRepository
    var studentHandler: ((FetchStudentStatus) -> Void)?
    
    init(studentRepository: StudentRepository) {
        self.studentRepository = studentRepository
    }
    
    func fetchStudents() {
        studentRepository.fetchStudents { [weak self] res in
            switch res {
            case .success(let students):
                self?.studentHandler?(.didFetchStudents(students))
            case .failure(let error):
                self?.studentHandler?(.didFetchStudentsFail(error.message))
            }
        }
    }
}
