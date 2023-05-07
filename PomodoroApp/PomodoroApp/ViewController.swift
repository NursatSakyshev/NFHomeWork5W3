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
        
        let circleView = CircleStrokeView(frame: CGRect(x: 0, y: 0, width: 248, height: 248))
        view.addSubview(circleView)
        
        circleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circleView.widthAnchor.constraint(equalToConstant: 248),
            circleView.heightAnchor.constraint(equalToConstant: 248),
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 52)
        ])
    }
}

class CircleStrokeView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.height / 2 - 5

        let path = UIBezierPath()
        path.addArc(withCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)

        UIColor(red: 1, green: 1, blue: 1, alpha: 0.3).setStroke()
        path.lineWidth = 6.0
        path.lineCapStyle = .round

        path.stroke()
    }
}
