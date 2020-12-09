//
//  ApplicationFillingViewController.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol ApplicationFillingViewControllerInput: ApplicationFillingPresenterOutput {
   
}

protocol ApplicationFillingViewControllerOutput {
    
}

public final class ApplicationFillingViewController: UIViewController, ApplicationFillingViewControllerInput {
    let contentView = ApplicationFillingView()
    var output: ApplicationFillingViewControllerOutput?
    var behaviorRelay: BehaviorRelay<Int?> = BehaviorRelay<Int?>(value: 0)
    
    let user: UserEntity = User.shared
    
    public override func loadView() {
        view = contentView
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
        loadTableViewCell()
        contentView.sectionsTableView.reloadData()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        let logoLabelColor = UIColor(red: 0.08, green: 0.36, blue: 0.65, alpha: 1)
        navigationController?.navigationBar.tintColor = logoLabelColor
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.topItem?.title = ""
        let title = "Оценка занятий"
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
        let infoButton = UIButton(type: .infoLight)
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: infoButton)
        self.navigationItem.rightBarButtonItem = barButton
        loadTableViewCell()
        behaviorRelay.skip(1).subscribe(onNext: { index in
            switch index {
            case 0:
                self.show(EstimationConfigurator.sharedInstance.configure(), sender: nil)
            case 1:
                return
            case 2:
                self.show(AdditionalInformationConfigurator.sharedInstance.configure(), sender: nil)
            case 3:
                
                self.show(StudStatsConfigurator.sharedInstance.configure(), sender: nil)
            case 4:
                self.show(StatsConfigurator.sharedInstance.configure(), sender: nil)
         
            default:
                return
            }
        })
    }
    
    private func loadTableViewCell() {
        contentView.insertSections(behaviorRelay: behaviorRelay, [
            ApplicationSection(name: "Оценка занятий", isFilled:false, image: UIImage(named: "ic_questionnaire") ?? UIImage()),
            ApplicationSection(name: "Личный кабинет", isFilled: false, image: UIImage(named: "ic_individualAchievements") ?? UIImage()),
            ApplicationSection(name: "Расписание", isFilled: false, image: UIImage(named: "ic_schools") ?? UIImage()),
            ApplicationSection(name: "Статистика", isFilled: false, image: UIImage(named: "ic_additionalInfo") ?? UIImage()),
            ApplicationSection(name: "Статистика преподавателя", isFilled: false, image: UIImage(named: "ic_editButton") ?? UIImage()),
            
            ]
        )
    }
    
    private func loadData() {
        //contentView.showLoader()
    }
    
    
    

    
    @objc
    func infoButtonTapped() {
        self.show(ApplicationFillingHelpViewController(), sender: nil)
    }

    // MARK: - Navigation

    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
