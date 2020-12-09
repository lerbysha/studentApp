//
//  StudStatsConfigurator.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import UIKit
import Foundation

final class StudStatsConfigurator {
    static let sharedInstance = StudStatsConfigurator()
    
    func configure() -> UIViewController {
        let viewController = StudStatsController()
        let interactor = StudStatsInteractor()
        let presenter = StudStatsPresenter()
        
        viewController.output = interactor
        interactor.output = presenter
        presenter.output = viewController
        
        return viewController
    }
}
