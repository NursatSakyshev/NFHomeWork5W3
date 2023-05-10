//
//  HIstoryViewController.swift
//  PomodoroApp
//
//  Created by Nursat Sakyshev on 10.05.2023.
//

import UIKit

class HIstoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var date = ["12.11.12", "21.23.34", "12.12.12"]
    
    var settingsDate = ["12.11.12" : ["Focus time": "20", "Break time" : "50"], "21.23.34": ["Focus time": "30", "Break time" : "40"], "12.12.12": ["Focus time": "12", "Break time" : "340"]]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return date.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryCell
        cell.timeMode.text = indexPath.row == 0 ? "Focus time" : "Break time"
        let today = date[indexPath.section]
        cell.time.text = indexPath.row == 0 ? settingsDate[today]!["Focus time"] : settingsDate[today]!["Break time"]
        cell.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1)
        cell.isUserInteractionEnabled = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        54
    }
    
    
    let label = UILabel()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1)
        label.text = "History"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = view.backgroundColor
        tableView.register(HistoryCell.self, forCellReuseIdentifier: "cell")

        
        [tableView, label].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 26),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 56),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let sectionContentView = UILabel()
        sectionContentView.text = date[section]
        sectionContentView.textColor = .white
        sectionContentView.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        sectionContentView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(sectionContentView)
        NSLayoutConstraint.activate([
            sectionContentView.heightAnchor.constraint(equalToConstant: 22),
            sectionContentView.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 16)
        ])
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        return footerView
    }
}
class HistoryCell: UITableViewCell {
    let timeMode = UILabel()
    let time = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        timeMode.textColor = .white
        time.textColor = UIColor(red: 235/255, green: 235/255, blue: 245/255, alpha: 0.6)
        time.text = "hello"
        
        [timeMode, time].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            timeMode.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            timeMode.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -11),
            timeMode.widthAnchor.constraint(equalToConstant: 304),
            timeMode.heightAnchor.constraint(equalToConstant: 22),
            
            time.bottomAnchor.constraint(equalTo: timeMode.bottomAnchor),
            time.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
