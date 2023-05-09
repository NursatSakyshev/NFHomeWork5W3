////
////  TestViewController.swift
////  PomodoroApp
////
////  Created by Nursat Sakyshev on 08.05.2023.
////
//
//import UIKit
//
//class TestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
//        cell.label.text = "Settings"
//        return cell
//    }
//    
//    var datePicker = UIDatePicker()
//    var tableView = UITableView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
//        tableView.rowHeight = 74
//        
//        view.addSubview(tableView)
//        
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
////        datePicker.datePickerMode = .time
////        datePicker.locale = Locale(identifier: "ru_RU")
////        datePicker.isUserInteractionEnabled = true
//        
////        view.addSubview(datePicker)
////        datePicker.translatesAutoresizingMaskIntoConstraints = false
////        NSLayoutConstraint.activate([
////            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
////            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor)
////        ])
////        datePicker.inputViewController?.title = ""
//    }
//    
//}
//
//class CustomCell: UITableViewCell {
//    var label: UILabel = UILabel()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        let datePicker = UIDatePicker()
//        datePicker.datePickerMode = .time
////        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
//        datePicker.locale = Locale(identifier: "ru_RU")
//
//        [datePicker, label].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            contentView.addSubview($0)
//        }
//
//        NSLayoutConstraint.activate([
//            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
//            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -11),
//            label.widthAnchor.constraint(equalToConstant: 304),
//            label.heightAnchor.constraint(equalToConstant: 22),
//            
//            datePicker.bottomAnchor.constraint(equalTo: label.bottomAnchor),
//            datePicker.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)
//        ])
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
////    @objc func datePickerValueChanged(_ datePicker: UIDatePicker) {
////        time = datePicker.date
////        label.text = "\(time)"
////    }
//}
//
//
///*
// class CustomCell: UITableViewCell {
// //    var time: Date = Date()
//     let label: UILabel = UILabel()
//
//     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//         super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//         let datePicker = UIDatePicker()
//         datePicker.datePickerMode = .time
// //        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
//         datePicker.locale = Locale(identifier: "ru_RU")
//
//         contentView.addSubview(datePicker)
//         datePicker.translatesAutoresizingMaskIntoConstraints = false
//
//         NSLayoutConstraint.activate([
//             datePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//             datePicker.topAnchor.constraint(equalTo: contentView.topAnchor),
//             datePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//             datePicker.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//         ])
//
//         label.textAlignment = .center
//         label.translatesAutoresizingMaskIntoConstraints = false
//
//         contentView.addSubview(label)
//
//         NSLayoutConstraint.activate([
//             label.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
//             label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
//         ])
//     }
//
//     required init?(coder: NSCoder) {
//         fatalError("init(coder:) has not been implemented")
//     }
//
// //    @objc func datePickerValueChanged(_ datePicker: UIDatePicker) {
// //        time = datePicker.date
// //        label.text = "\(time)"
// //    }
// }
//
// */
