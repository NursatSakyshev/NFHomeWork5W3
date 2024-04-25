//
//  HIstoryViewController.swift
//  PomodoroApp
//
//  Created by Nursat Sakyshev on 10.05.2023.
//

import UIKit

class HIstoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var days: [String] {
        UserDefaults.standard.object(forKey: "days") as? [String] ?? []
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return days.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryCell
        cell.timeMode.text = indexPath.row == 0 ? "Focus time" : "Break time"
        let day = days[indexPath.section]
        var history = (UserDefaults.standard.object(forKey: day) as? [String: Int] ?? ["Focus time": 0, "Break time": 0])
        cell.time.text = indexPath.row == 0 ? history["Focus time"]?.toDate() : history["Break time"]?.toDate()
        cell.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1)
        cell.isUserInteractionEnabled = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        54
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.title = "History"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = view.backgroundColor
        tableView.register(HistoryCell.self, forCellReuseIdentifier: "cell")

        
        [tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 104),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let sectionContentView = UILabel()
        sectionContentView.text = days[section]
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
