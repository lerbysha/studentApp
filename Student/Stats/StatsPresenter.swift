//
//  StatsPresenter.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation
import UIKit

protocol StatsPresenterInput: StatsInteractorOutput {
   
}

protocol StatsPresenterOutput {
    
}

final class StatsPresenter: StatsPresenterInput {
    var output: StatsPresenterOutput?
    
   
}
