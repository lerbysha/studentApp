//
// StatsConfigurator.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import UIKit
import Foundation

final class StatsConfigurator {
    static let sharedInstance = StatsConfigurator()
    
    func configure() -> UIViewController {
        let viewController = StatsViewController()
        let interactor = StatsInteractor()
        let presenter = StatsPresenter()
        
        viewController.output = interactor
        interactor.output = presenter
        presenter.output = viewController
        
        return viewController
    }
}
