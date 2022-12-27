//
//  DoubleExtension.swift
//  ConverterTemperature
//
//  Created by Flore Gridaine on 2022-12-27.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
