//
//  ViewController.swift
//  ConverterTemperature
//
//  Created by Flore Gridaine on 2022-12-25.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var pickerViewBottom: UIPickerView!
    @IBOutlet weak var labelResults: UILabel!
    @IBOutlet weak var degreesField: UITextField!
    @IBOutlet weak var pickerViewTop: UIPickerView!
    private let model = ConversionTemperature()
    private var type = (from: 0, to: 0)
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    
    @IBAction func didTapConvertButton(_ sender: Any) {
        //etape 1 : recuperer les info
        guard let temperature = degreesField.text else { return }
        guard let temperatureDouble = Double(temperature) else { return }
        let from = pickerViewTop.selectedRow(inComponent: 0)
        let to = pickerViewBottom.selectedRow(inComponent: 0)
        
        //etaqe 2 : conversion
        let result = String(self.convertTemperature(temperature: temperatureDouble, type: (from, to)))
        
        //etape 3 : qffichge
        self.showResult(result: result)
        
    }
    
    //MARK: - Methods
    
    private func convertTemperature(temperature: Double, type: (Int, Int)) -> Double {
        switch (type) {
        case (0,1):
            return model.conversionCelsiusToFarenheit(temperature: temperature)
        case (0,2):
            return model.conversionCelsiusToKelvin(temperature: temperature)
        case (1,0):
            return model.conversionFarenheitToCelsius(temperature: temperature)
        case (1,2):
            return model.conversionFarenheitToKelvin(temperature: temperature)
        case (2,0):
            return model.conversionKelvinToCelsius(temperature: temperature)
        case (2,1):
            return model.conversionKelvinToFarenheit(temperature: temperature)
        default :
            return temperature
        }
        
    }
    
    private func showResult(result: String?) {
        labelResults.text = result
    }
}

//MARK: -  PickerView UIPickerViewDataSource, UIPickerViewDelegate

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typeDegrees[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typeDegrees.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
}

//MARK: - Keyboard

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        degreesField.resignFirstResponder()
        
    }
    
    
}
