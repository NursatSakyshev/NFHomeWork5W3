//
//  TableViewController.swift
//  PomodoroApp
//
//  Created by Nursat Sakyshev on 07.05.2023.
//

import UIKit

class TableViewController: UITableViewController {
    var selectedDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor =  UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1)
        tableView.rowHeight = 54
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.name.text = "Settings"
        cell.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1)
        cell.dateTextView.text = "hello"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func datePickerValueChanged(_ datePicker: UIDatePicker) {
        selectedDate = datePicker.date
    }
}

//class CustomCell: UITableViewCell {
//    let name = UILabel()
//    let datePicker = UIDatePicker()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        name.textColor = .white
//        datePicker.datePickerMode = .time
//        datePicker.locale = Locale(identifier: "ru_RU")
//        datePicker.isUserInteractionEnabled = true
//
//        addSubview(name)
//        addSubview(datePicker)
//
//        [name, datePicker].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//        }
//
//        NSLayoutConstraint.activate([
//            name.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
//            name.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -11),
//            name.widthAnchor.constraint(equalToConstant: 304),
//            name.heightAnchor.constraint(equalToConstant: 22),
//
//            datePicker.bottomAnchor.constraint(equalTo: name.bottomAnchor),
//            datePicker.widthAnchor.constraint(equalToConstant: 65),
//            datePicker.heightAnchor.constraint(equalToConstant: 30),
//            datePicker.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)
//        ])
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}

class CustomCell: UITableViewCell {
    let name = UILabel()
    let dateTextView = UITextView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        name.textColor = .white
        dateTextView.textColor = .black
        dateTextView.layer.borderWidth = 1.0
        dateTextView.layer.borderColor = UIColor.gray.cgColor
        dateTextView.layer.cornerRadius = 5.0
        dateTextView.delegate = self
        
        addSubview(name)
        addSubview(dateTextView)
        
        [name, dateTextView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            name.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            name.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -11),
            name.widthAnchor.constraint(equalToConstant: 304),
            name.heightAnchor.constraint(equalToConstant: 22),
            
            dateTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -11),
            dateTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            dateTextView.heightAnchor.constraint(equalToConstant: 30),
            dateTextView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomCell: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
    }
}
