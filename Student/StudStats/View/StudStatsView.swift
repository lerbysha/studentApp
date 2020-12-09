//
//  StudStatsView.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation
import UIKit
import Charts

final class StudStatsView: UIView {
    private let appearance = Appearance()
    public let descriptions = ["Пу", "Объ", "Спь", "пары", "воп"]
    
    public let unitsSold = [4.0, 2.5, 4.5, 3.0, 4.0]
    
    let scores: [ChartDataEntry] = [
        ChartDataEntry(x: 4.0, y: 14.4),
        ChartDataEntry(x: 2.2, y: 43.8),
        ChartDataEntry(x: 3.0, y: 22.4),
        ChartDataEntry(x: 6.7, y: 54.0),
        ChartDataEntry(x: 10.0, y: 4.9)
    ]
    
    func setChart(dataPoints: [String], values: [Double]) {
//        var dataEntries: [BarChartDataEntry] = []
//
//        for i in 0..<dataPoints.count {
//            let dataEntry = BarChartDataEntry(x: values[i], y: Double(i))
//            dataEntries.append(dataEntry)
//        }
//
//        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Средний балл")
//        let chartData = BarChartData( dataSet: chartDataSet)
//        barChart.data = chartData
        let setOfPoints = LineChartDataSet(entries: scores, label: "Средний балл")
        let data = LineChartData(dataSet: setOfPoints)
        barChart.data =  data
        setOfPoints.colors = ChartColorTemplates.colorful()

    
    }
    
    lazy var barChart : LineChartView = {
        let chartView = LineChartView()
      
        return chartView
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
        setChart(dataPoints: descriptions, values: unitsSold)
    }

    

    private func setupStyles() {
        backgroundColor = .white
    }

    private func addSubviews() {
        addSubview(barChart)
       
    }
    
    private func makeConstraints() {
        barChart.snp.makeConstraints { make in
            make.edges.centerX.equalToSuperview()
        }
        
        
    }
}

extension StudStatsView {
    public struct Appearance {
        let stackSpacing: CGFloat = 16
        let typeOfSchool = "Тип учебного заведения"
        let lastYear = "Год окончания учебного заведения"
        let typeOfEducation = "Полученное образование"
        let nameOfSchool = "Оконченное учебное заведение"
        let additionalInformation = "При отсуствии в списке ввести как в аттестате (дипломе)"
        let certificateSeries = "Серия аттестата (диплома)"
        let optionalАield = "Необязательно для заполнения"
        let certificateNumber = "Номер аттестата (диплома)"
        let submit = "Сохранить"
        let buttonHeigh: CGFloat = 36
    }
}
