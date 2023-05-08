//
//  ViewController.swift
//  PomodoroApp
//
//  Created by Nursat Sakyshev on 07.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let image = UIImageView(image: UIImage(named: "BG"))
    let date = Date()
    let button = UIButton()
    let playButton = UIButton()
    let stopButton = UIButton()
    let stackView = UIStackView()
    let motivationLabel = UILabel()
    let timeLabel = UILabel()
    let circleView = CircleStrokeView(frame: CGRect(x: 0, y: 0, width: 248, height: 248))
    let circleProgressView = CircleProgressView(frame: CGRect(x: 0, y: 0, width: 248, height: 248))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        [button, playButton, stopButton, stackView, motivationLabel, timeLabel, circleView, circleProgressView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        circleProgressView.setProgress(0.5)
        
        view.addSubview(image)
        view.addSubview(button)
        view.addSubview(circleView)
        view.addSubview(circleProgressView)
        view.addSubview(timeLabel)
        view.addSubview(motivationLabel)
        view.addSubview(stackView)
        
        let pencilImage = UIImage(systemName: "pencil", withConfiguration: UIImage.SymbolConfiguration(weight: .black))
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        button.layer.cornerRadius = 20
        button.setImage(pencilImage, for: .normal)
        button.setTitle("Focus Category", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.tintColor = .white
        
        timeLabel.text = "\(date.toString())"
        timeLabel.textColor = .white
        timeLabel.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        timeLabel.textAlignment = .center
        
        motivationLabel.text = "Focus on your task"
        motivationLabel.textColor = .white
        motivationLabel.font = UIFont.systemFont(ofSize: 16)
        motivationLabel.textAlignment = .center
        
        playStopButtonConfiguration(playButton, imageName: "play", pointSize: 25)
        playStopButtonConfiguration(stopButton, imageName: "stop.fill", pointSize: 20)
        
        stackView.addArrangedSubview(playButton)
        stackView.addArrangedSubview(stopButton)
        stackView.axis = .horizontal
        stackView.spacing = 80
        stackView.alignment = .center
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 170),
            button.heightAnchor.constraint(equalToConstant: 36),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 148),
            
            circleView.widthAnchor.constraint(equalToConstant: 248),
            circleView.heightAnchor.constraint(equalToConstant: 248),
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 52),
            
            circleProgressView.widthAnchor.constraint(equalToConstant: 248),
            circleProgressView.heightAnchor.constraint(equalToConstant: 248),
            circleProgressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleProgressView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 52),
            
            timeLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: circleView.topAnchor, constant: 75),
            timeLabel.widthAnchor.constraint(equalToConstant: 200),
            timeLabel.heightAnchor.constraint(equalToConstant: 56),
            
            motivationLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            motivationLabel.widthAnchor.constraint(equalToConstant: 200),
            motivationLabel.heightAnchor.constraint(equalToConstant: 24),
            motivationLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 4),
            
            playButton.widthAnchor.constraint(equalToConstant: 56),
            playButton.heightAnchor.constraint(equalToConstant: 56),
            
            stopButton.widthAnchor.constraint(equalToConstant: 56),
            stopButton.heightAnchor.constraint(equalToConstant: 56),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 60)
        ])
    }
    
    func playStopButtonConfiguration(_ sender: UIButton, imageName: String, pointSize: CGFloat) {
        let image = UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(pointSize: pointSize, weight: .bold))
        sender.setImage(image, for: .normal)
        sender.tintColor = .white
        sender.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        sender.layer.cornerRadius = 28
        sender.clipsToBounds = true
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

class CircleProgressView: UIView {
    private var progressLayer: CAShapeLayer!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProgressLayer()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupProgressLayer()
    }

    private func setupProgressLayer() {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2.0 - 5
        let startAngle = -CGFloat.pi / 2.0
        let endAngle = startAngle + (2.0 * CGFloat.pi)
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        progressLayer = CAShapeLayer()
        progressLayer.path = circularPath.cgPath
        progressLayer.strokeColor = UIColor.white.cgColor
        progressLayer.lineWidth = 6.0
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeEnd = 0.0  // Initial progress

        layer.addSublayer(progressLayer)
    }

    func setProgress(_ progress: CGFloat) {
        progressLayer.strokeEnd = progress
    }
}

extension Date {
    func getSeconds() -> Int {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        let minutes = calendar.component(.minute, from: self)
        let seconds = calendar.component(.second, from: self)
        return hour * 3600 + minutes * 60 + seconds
    }
    
    func getDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YY"
        return formatter.string(from: self)
    }
    
    func toString() -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        let formatter = DateFormatter()
        formatter.dateFormat = hour == 0 ? "mm:ss" : "HH:mm:ss"
        let stringFormat = formatter.string(from: self)
        return stringFormat
    }
    
}
