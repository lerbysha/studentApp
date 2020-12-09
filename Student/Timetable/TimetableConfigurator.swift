//
//  TimetableConfigurator.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import UIKit
import Foundation

final class TimetableConfigurator {
    static let sharedInstance = TimetableConfigurator()
    
    func configure() -> UIViewController {
        let viewController = TimetableViewController()
        let interactor = TimetableInteractor()
        let presenter = TimetablePresenter()
        
        viewController.output = interactor
        interactor.output = presenter
        presenter.output = viewController
        
        return viewController
    }
}
