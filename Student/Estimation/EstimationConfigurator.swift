//
//  QuestionnaireConfigurator.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import UIKit
import Foundation

final class EstimationConfigurator {
    static let sharedInstance = EstimationConfigurator()
    
    func configure() -> UIViewController {
        let viewController = EstimationViewController()
        let interactor = EstimationInteractor()
        let presenter = EstimationPresenter()
        
        viewController.output = interactor
        interactor.output = presenter
        presenter.output = viewController
        
        return viewController
    }
}
