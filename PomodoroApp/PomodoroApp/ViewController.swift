//
//  ViewController.swift
//  PomodoroApp
//
//  Created by Nursat Sakyshev on 07.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let image = UIImageView(image: UIImage(named: "BG"))
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.addSubview(image)
        let configuration = UIImage.SymbolConfiguration(weight: .black)
        let pencilImage = UIImage(systemName: "pencil", withConfiguration: configuration)
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        button.layer.cornerRadius = 20
        button.setImage(pencilImage, for: .normal)
        button.setTitle("Focus Category", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.tintColor = .white
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 170),
            button.heightAnchor.constraint(equalToConstant: 36),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 148),
        ])
    }
}

