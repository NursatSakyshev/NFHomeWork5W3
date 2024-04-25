//
//  HistoryViewCell.swift
//  PomodoroApp
//
//  Created by Nursat Sakyshev on 25.04.2024.
//

import UIKit

class HistoryCell: UITableViewCell {
    let timeMode = UILabel()
    let time = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        timeMode.textColor = .white
        time.textColor = UIColor(red: 235/255, green: 235/255, blue: 245/255, alpha: 0.6)
        
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

