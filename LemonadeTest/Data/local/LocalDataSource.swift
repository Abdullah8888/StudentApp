//
//  LocalDataSource.swift
//  LemonadeTest
//
//  Created by Abdullah on 30/06/2022.
//

import Foundation

class LocalDataSource {
    
    static var shared: LocalDataSource = LocalDataSource()
    
    fileprivate init() {}
    
    @UserDefaultCodable(key: UserDefaultConstant.CACHE_STUDENT, default: [])
    var students: [Student]?
}

