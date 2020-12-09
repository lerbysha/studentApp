//
//  QuestionnaireView.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class EstimationView: UIView {
    private let appearance = Appearance()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var containterView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = appearance.stackSpacing
        view.alignment = .fill
        view.distribution = .fillProportionally
        return view
    }()
    
    
    
    
    lazy var subjectView: SelectionView = {
        return SelectionView(citizenshipLabelText: appearance.subject, citizenshipPlaceholderText: appearance.subject)
    }()
    
    lazy var punctualityView: SelectionView = {
        return SelectionView(citizenshipLabelText: appearance.punctuality, citizenshipPlaceholderText: appearance.punctuality)
    }()
    
    lazy var objectivityView: SelectionView = {
        return SelectionView(citizenshipLabelText: appearance.objectivity, citizenshipPlaceholderText: appearance.objectivity)
    }()
    
    lazy var knowladgeView: SelectionView = {
        return SelectionView(citizenshipLabelText: appearance.knowladge , citizenshipPlaceholderText: appearance.knowladge )
    }()
    
    lazy var benefitView: SelectionView = {
        return SelectionView(citizenshipLabelText: appearance.benefit, citizenshipPlaceholderText: appearance.benefit)
    }()
    
    lazy var questionView: SelectionView = {
        return SelectionView(citizenshipLabelText: appearance.question, citizenshipPlaceholderText: appearance.question)
    }()
    
    
    lazy var submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(appearance.submit, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .logoLabelColor
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        setupStyles()
        addSubviews()
        makeConstraints()
        addTapGesture()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onShowKeyboard(notification:)),
            name: UIWindow.keyboardWillShowNotification, object: nil
        )
        NotificationCenter.default.addObserver(
            self, selector: #selector(onHideKeyboard),
            name: UIWindow.keyboardWillHideNotification,
            object: nil
        )
    }

    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        addGestureRecognizer(tapGesture)
    }

    @objc
    private func onShowKeyboard(notification: Notification) {
        guard let keyboardFrameValue = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
        let keyboardFrame = convert(keyboardFrameValue.cgRectValue, from: nil)
        scrollView.contentInset.bottom = keyboardFrame.size.height
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }

    @objc
    private func onHideKeyboard() {
        scrollView.contentInset = .zero
    }

    @objc
    private func hideKeyboard() {
        endEditing(true)
    }

    private func setupStyles() {
        backgroundColor = .white
    }

    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(containterView)
        scrollView.addSubview(submitButton)
        containterView.addArrangedSubview(subjectView)
        containterView.addArrangedSubview(punctualityView)
        containterView.addArrangedSubview(objectivityView)
        containterView.addArrangedSubview(knowladgeView)
        containterView.addArrangedSubview(benefitView)
        containterView.addArrangedSubview(knowladgeView)
        containterView.addArrangedSubview(questionView)
        
    }

    private func makeConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.centerX.equalToSuperview()
        }
        containterView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32)
            make.leading.trailing.equalToSuperview().inset(24)
            make.centerX.equalToSuperview()
        }
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(containterView.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(appearance.buttonHeigh)
            make.bottom.equalToSuperview().inset(32)
        }
        
    }
}

extension EstimationView {
    public struct Appearance {
        let subject = "Предмет"
        let punctuality = "Пунктуальность"
        let objectivity = "Объективность оценки знаний"
        let knowladge = "Способность донести материал"
        let benefit = "Практическая польза пары"
        let question = "Возможность задавать вопросы, высказывать свое мнение"
        let stackSpacing: CGFloat = 16
        let submit = "Сохранить"
        let containerInset: CGFloat = 20
        let buttonHeigh: CGFloat = 36
        let buttonWidth: CGFloat = 100
        
    }
}
