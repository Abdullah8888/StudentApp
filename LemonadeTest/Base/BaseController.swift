//
//  BaseController.swift
//  LemonadeTest
//
//  Created by Abdullah on 30/06/2022.
//

import Foundation
import UIKit

class BaseController<SubView: UIView>: UIViewController {
    let _view: SubView
    
    init(view: SubView = SubView()) {
        self._view = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        
        view = _view
        view.clipsToBounds = true
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
