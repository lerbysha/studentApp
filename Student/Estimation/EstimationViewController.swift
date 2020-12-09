//
//  QuestionnaireViewController.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import UIKit
import RxCocoa

protocol EstimationViewControllerInput: EstimationPresenterOutput {
    
}

protocol EstimationViewControllerOutput {
    func submit(questionnaireModel: EstimationModel)
}

class EstimationViewController: UIViewController, EstimationViewControllerInput {
    let contentView = EstimationView()
    var output: EstimationViewControllerOutput?
    let user: UserEntity = User.shared
    var updateQuestionnaire = BehaviorRelay<SelectedExam?>(value: nil)
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        
        let subjectViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(subjectViewTapped))
        let scoreTapGesture = UITapGestureRecognizer(target: self, action: #selector(scoreTapped))
        
        contentView.subjectView.addGestureRecognizer(subjectViewTapGesture)
        contentView.punctualityView.addGestureRecognizer(scoreTapGesture)
        contentView.objectivityView.addGestureRecognizer(scoreTapGesture)
        contentView.knowladgeView.addGestureRecognizer(scoreTapGesture)
        contentView.benefitView.addGestureRecognizer(scoreTapGesture)
        contentView.questionView.addGestureRecognizer(scoreTapGesture)
        
        updateQuestionnaire.subscribe { event in
            guard let event = event.element as? SelectedExam else { return }
            switch event.isFrom {
            case .subject:
                (self.contentView.subjectView as SelectionView).setPlaceholderText(text: event.examName)
            case .score:
                (self.contentView.punctualityView as SelectionView).setPlaceholderText(text: event.examName)
            default: break
            }
        }
    }
    
    @objc
    private func subjectViewTapped() {
        let floatingPanel = FloatingPanelBulder()
        .build(
            contentVC: ParametrPickerConfigurator(isFrom: .subject, behaviorRelay: updateQuestionnaire).configure()
        )
        self.present(floatingPanel, animated: true)
    }
    
    @objc
    private func scoreTapped() {
        let floatingPanel = FloatingPanelBulder()
        .build(
            contentVC: ParametrPickerConfigurator(isFrom: .score, behaviorRelay: updateQuestionnaire).configure()
        )
        self.present(floatingPanel, animated: true)
    }
    
    @objc
    private func submitButtonTapped() {
        
        output?.submit(questionnaireModel: EstimationModel(
            
            subject: "",
            punctuality: "",
            objectivity: "",
            citizenship: "",
            knowladge: "",
            benefit: "",
            question: ""
            
            )
        )
        navigationController?.popViewController(animated: true)
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationControllerInit()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isTranslucent = false
    }
    
    private func navigationControllerInit() {
        let logoLabelColor = UIColor.logoLabelColor
        navigationController?.navigationBar.tintColor = logoLabelColor
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.topItem?.title = ""
        let title = "Оценка"
        let titleLabel = UILabel(
            text: title,
            font: UIFont.systemFont(ofSize: 24, weight: .bold),
            textColor: logoLabelColor,
            textAlignment: .center,
            numberOfLines: 1,
            lineBreakMode: .byWordWrapping,
            backgroundColor: .white,
            adjustsFontSizeToFitWidth: false
        )
        navigationItem.titleView = titleLabel
    }
}

extension UINavigationController {
    public func makeTransparent(withTint tint: UIColor = .white) {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.tintColor = tint
        navigationBar.titleTextAttributes = [.foregroundColor: tint]
    }
}
