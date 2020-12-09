//
// StatsViewController.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import UIKit
import Charts

protocol StatsViewControllerInput: StatsPresenterOutput {
  
}

protocol StatsViewControllerOutput {
   
}

public final class StatsViewController: UIViewController, StatsViewControllerInput {
    let contentView = StatsView()
    var output: StatsViewControllerOutput?
    
    
    public override func loadView() {
        view = contentView
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: values[i], y: Double(i))
            dataEntries.append(dataEntry)
        }
        
    let chartSet = BarChartData()
    
    }
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        let logoLabelColor = UIColor(red: 0.08, green: 0.36, blue: 0.65, alpha: 1)
        navigationController?.navigationBar.tintColor = logoLabelColor
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.topItem?.title = ""
        let title = "Статистика преподавателя"
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
//        contentView.addSubjectsButton.addTarget(self, action: #selector(addSubjectsButtonTapped), for: .touchUpInside)
         let descriptions = ["Пунктуальность", "Объективность", "Способность", "польза пары", "вопросы"]
        
         let unitsSold = [4.0, 2.5, 4.5, 3.0, 4.0]
        
    }
    
    private func loadData() {
        //contentView.showLoader()
    }
    
    
  

    // MARK: - Navigation

    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
