//
//  StudentRepository.swift
//  LemonadeTest
//
//  Created by Abdullah on 30/06/2022.
//

import Foundation


class StudentRepository {
    
    private let remoteDataSource: RemoteDataSource
    private let localDataSource: LocalDataSource
    
    init(remoteDataSource: RemoteDataSource, localDataSource: LocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func fetchStudents(completionHandler completion: @escaping (Result<[Student], RemoteDataSourceErrorModel>) -> Void) {
        if localDataSource.students?.isEmpty ?? false {
            remoteDataSource.fetch(relativePath: "students", method: .get, type: [Student].self) { [weak self] response in
                switch response {
                case .success(let students):
                    completion(.success(students))
                    self?.localDataSource.students = students
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        else {
            DispatchQueue.main.async {
                completion(.success(self.localDataSource.students ?? []))
            }
        }
    }
}

