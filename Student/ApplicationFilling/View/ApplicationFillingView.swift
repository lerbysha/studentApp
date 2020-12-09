//
//  ApplicationFillingView.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa

struct ApplicationSection {
    let name: String
    let isFilled: Bool
    let image: UIImage
}

final class ApplicationFillingView: UIView {
    private let appearance = Appearance()
    private var applicationSections: [ApplicationSection]?
    var behaviorRelay: BehaviorRelay<Int?> = BehaviorRelay<Int?>(value: 0)
    
    lazy var sectionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
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
        sectionsTableView.delegate = self
        sectionsTableView.dataSource = self
        sectionsTableView.register(ApplicationFillingTableViewCell.self, forCellReuseIdentifier: appearance.sectionsTableViewCellIdentifier)
        setupStyles()
        addSubviews()
        makeConstraints()
    }

    private func setupStyles() {
        backgroundColor = .white
    }

    private func addSubviews() {
        addSubview(sectionsTableView)
    }

    private func makeConstraints() {
        
        sectionsTableView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
    }    
}

extension ApplicationFillingView {
    public struct Appearance {
        let submit = "Подать заявление"
        let buttonHeigh: CGFloat = 36
        let sectionsTableViewCellIdentifier = "sectionsTableViewCellIdentifier"
    }
}

extension ApplicationFillingView: UITableViewDelegate, UITableViewDataSource {
    func insertSections(behaviorRelay: BehaviorRelay<Int?>, _ sections: [ApplicationSection]) {
        self.applicationSections = sections
        self.behaviorRelay = behaviorRelay
        
        DispatchQueue.main.async {
            self.sectionsTableView.reloadData()
            self.sectionsTableView.layoutIfNeeded()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applicationSections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = sectionsTableView.dequeueReusableCell(withIdentifier: appearance.sectionsTableViewCellIdentifier) as? ApplicationFillingTableViewCell else { return UITableViewCell()}
        cell.sectionLabel.text = applicationSections?[indexPath.row].name
        cell.iconImageView.image = applicationSections?[indexPath.row].image
        cell.filledSectionButton.isSelected = applicationSections?[indexPath.row].isFilled ?? false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        behaviorRelay.accept(indexPath.row)
    }
}
