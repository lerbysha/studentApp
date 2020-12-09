//
//  ExamsInteractor.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol StatsInteractorInput: StatsViewControllerOutput {
    
}

protocol StatsInteractorOutput {
  
}

final class StatsInteractor: StatsInteractorInput {
    var output: StatsInteractorOutput?
    let provider = StatsProvider()
    let user: UserEntity = User.shared
    
    
}
