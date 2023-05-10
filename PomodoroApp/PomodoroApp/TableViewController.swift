//
//  TableViewController.swift
//  PomodoroApp
//
//  Created by Nursat Sakyshev on 07.05.2023.
//

import UIKit

class Settings {
    var focusTime: Date {
        set {
            UserDefaults.standard.set(newValue, forKey: "FocusTime")
        }
        get {
            UserDefaults.standard.object(forKey: "FocusTime") as? Date ?? Date()
        }
    }
    
    var currentTime: Date {
        set {
            UserDefaults.standard.set(newValue, forKey: "FocusTime")
        }
        get {
            UserDefaults.standard.object(forKey: "FocusTime") as? Date ?? Date()
        }
    }
    
    var breakTime: Date {
        set {
            UserDefaults.standard.set(newValue, forKey: "BreakTime")
        }
        get {
            UserDefaults.standard.object(forKey: "BreakTime") as? Date ?? Date()
        }
    }
}

class TableViewController: UITableViewController {
    var settings = Settings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor =  UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1)
        tableView.rowHeight = 54
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 2 }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.timeMode.text = indexPath.row == 0 ? "Focus time" : "Break time"
        cell.datePicker.date = indexPath.row == 0 ? settings.focusTime : settings.breakTime
        cell.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1)
        cell.datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        cell.datePicker.tag = indexPath.row
        cell.selectionStyle = .none
        return cell
    }
    
    @objc func datePickerValueChanged(_ datePicker: UIDatePicker) {
        if datePicker.tag == 0 {
            settings.focusTime = datePicker.date
        }
        else {
            settings.breakTime = datePicker.date
        }
    }
}

class CustomCell: UITableViewCell {
    let timeMode = UILabel()
    let datePicker = UIDatePicker()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        timeMode.textColor = .white
        datePicker.datePickerMode = .time
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.isUserInteractionEnabled = true
//        datePicker.date = settings.focusTime
//        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        
        [timeMode, datePicker].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            timeMode.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            timeMode.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -11),
            timeMode.widthAnchor.constraint(equalToConstant: 304),
            timeMode.heightAnchor.constraint(equalToConstant: 22),
            
            datePicker.bottomAnchor.constraint(equalTo: timeMode.bottomAnchor),
            datePicker.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)
        ])
    }
    
//    @objc func datePickerValueChanged(_ datePicker: UIDatePicker) {
//        settings.focusTime = datePicker.date
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
