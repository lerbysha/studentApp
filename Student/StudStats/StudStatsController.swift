//
//  StudStatsViewController.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import UIKit
import RxCocoa

protocol StudStatsViewControllerInput: StudStatsPresenterOutput {
    
}

protocol StudStatsViewControllerOutput {
    func authorize(login: String, password: String)
}

class StudStatsController: UIViewController, StudStatsViewControllerInput {
    let contentView = StudStatsView()
    var output: StudStatsViewControllerOutput?
    let user: UserEntity = User.shared
    var updateSchools = BehaviorRelay<SelectedExam?>(value: nil)
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logoLabelColor = UIColor(red: 0.08, green: 0.36, blue: 0.65, alpha: 1)
        navigationController?.navigationBar.tintColor = logoLabelColor
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.topItem?.title = ""
        let title = "Статистика"
        let titleLabel = UILabel(
            text: title,
            font: UIFont.systemFont(ofSize: 24, weight: .bold),
            textColor: logoLabelColor,
            textAlignment: .center,
            numberOfLines: 1,
            lineBreakMode: .byWordWrapping,
            backgroundColor: .clear,
            adjustsFontSizeToFitWidth: false
        )
        navigationItem.titleView = titleLabel
       
    }
    
    @objc
    private func schoolTypeTapped() {
        let floatingPanel = FloatingPanelBulder()
        .build(
            contentVC: ParametrPickerConfigurator(isFrom: .schoolType, behaviorRelay: updateSchools).configure()
        )
        self.present(floatingPanel, animated: true)
    }
    
    @objc
    private func graduateTapped() {
        let floatingPanel = FloatingPanelBulder()
        .build(
            contentVC: ParametrPickerConfigurator(isFrom: .graduate, behaviorRelay: updateSchools).configure()
        )
        self.present(floatingPanel, animated: true)
    }
    
    @objc
    private func submitButtonTapped() {
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isTranslucent = false
    }
}
