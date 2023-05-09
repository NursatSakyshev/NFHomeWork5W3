//
//  TestViewController.swift
//  PomodoroApp
//
//  Created by Nursat Sakyshev on 08.05.2023.
//

import UIKit

class TestViewController: UIViewController {
    var datePicker = UIDatePicker()
//    var

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        datePicker.datePickerMode = .time
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.isUserInteractionEnabled = true
        view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        datePicker.inputViewController?.title = ""
    }
    
}
