//
//  ExamsView.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation
import UIKit
import Charts

final class StatsView: UIView, ChartViewDelegate {
   
    
    public let descriptions = ["Пу", "Объ", "Спь", "пары", "воп"]
    
    public let unitsSold = [4.0, 2.5, 4.5, 3.0, 4.0]
    
    let scores: [BarChartDataEntry] = [
        BarChartDataEntry(x: 1.0, y: 4.4),
        BarChartDataEntry(x: 2.0, y: 3.8),
        BarChartDataEntry(x: 3.0, y: 2.4),
        BarChartDataEntry(x: 4.0, y: 4.0),
        BarChartDataEntry(x: 5.0, y: 4.9)
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
        let setOfPoints = BarChartDataSet(entries: scores, label: "Средний балл")
        let data = BarChartData(dataSet: setOfPoints)
        barChart.data =  data
        setOfPoints.colors = ChartColorTemplates.colorful()

    
    }
        
  
        
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var barChart : BarChartView = {
        let chartView = BarChartView()
      
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

extension StatsView {
    public struct Appearance {
        let stackSpacing: CGFloat = 16
        let buttonHeigh: CGFloat = 36
        
        let examsTableViewCellIdentifier = "ExamsTableViewCell"
        let notesCollectionViewCellIdentifier = "ExamsCollectionViewCell"
        let backgroundColors = [UIColor(red: 0.565, green: 0.792, blue: 0.976, alpha: 1),
                                UIColor(red: 1, green: 0.733, blue: 0.576, alpha: 1),
                                UIColor(red: 0.565, green: 0.792, blue: 0.976, alpha: 1),
                                UIColor(red: 1, green: 0.733, blue: 0.576, alpha: 1),
                                UIColor(red: 0.565, green: 0.792, blue: 0.976, alpha: 1),
                                UIColor(red: 1, green: 0.733, blue: 0.576, alpha: 1),
                                UIColor(red: 0.565, green: 0.792, blue: 0.976, alpha: 1),
                                UIColor(red: 1, green: 0.733, blue: 0.576, alpha: 1),
                                UIColor(red: 0.565, green: 0.792, blue: 0.976, alpha: 1),
                                UIColor(red: 1, green: 0.733, blue: 0.576, alpha: 1),
                                UIColor(red: 0.565, green: 0.792, blue: 0.976, alpha: 1),
                                UIColor(red: 1, green: 0.733, blue: 0.576, alpha: 1)]
       
    }
}

