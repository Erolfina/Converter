//
//  CalculConversion.swift
//  ConverterTemperature
//
//  Created by Flore Gridaine on 2022-12-25.
//

import Foundation

final class ConversionTemperature {
    private var celsiusTemperature: Double = 0
    private var farenheitTemperature: Double = 0
    private var kelvinTemperature: Double = 0
    
    func conversionFarenheitToCelsius(temperature: Double) -> Double {
        celsiusTemperature = (temperature - 32)*5/9
        return celsiusTemperature.rounded(toPlaces: 2)
    }
    
    func conversionKelvinToCelsius(temperature: Double)  -> Double {
        celsiusTemperature = (temperature - 273.15)
        return celsiusTemperature.rounded(toPlaces: 2)
    }
    
    func conversionFarenheitToKelvin(temperature: Double)  -> Double {
        kelvinTemperature = (temperature + 459.67) * 5/9
        return kelvinTemperature.rounded(toPlaces: 2)
    }
    
    func conversionCelsiusToKelvin(temperature: Double) -> Double {
        kelvinTemperature = (temperature * 9/5 + 32)
        return kelvinTemperature.rounded(toPlaces: 2)
    }
    
    func conversionCelsiusToFarenheit(temperature: Double) -> Double {
        farenheitTemperature = (temperature * 9/5 + 32)
        return farenheitTemperature.rounded(toPlaces: 2)
    }
    
    func conversionKelvinToFarenheit(temperature: Double) -> Double {
        farenheitTemperature = (temperature * 9/5 - 459.67)
        return farenheitTemperature.rounded(toPlaces: 2)
    }
    
}
