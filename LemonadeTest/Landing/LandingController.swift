//
//  LandingController.swift
//  LemonadeTest
//
//  Created by Abdullah on 30/06/2022.
//

import Foundation
import UIKit

class LandingController: BaseController<LandingView> {
    
    var viewModel: LandingViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List of Students"
        
        viewModel?.fetchStudents()
        
        viewModel?.studentHandler = { [weak self] res in
            switch res {
            case .didFetchStudents(let students):
                self?._view.students = students
            case .didFetchStudentsFail(let errorMessage):
                debugPrint(errorMessage ?? "")
            }
        }
    }
}
