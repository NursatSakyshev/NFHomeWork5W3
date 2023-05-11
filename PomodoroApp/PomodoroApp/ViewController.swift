//
//  ViewController.swift
//  PomodoroApp
//
//  Created by Nursat Sakyshev on 07.05.2023.
//

import UIKit

enum mode {
    case Focus
    case Break
}

class ViewController: UIViewController {
    
    let image = UIImageView(image: UIImage(named: "BG"))
    let settings = Settings()
    lazy var date: Date = settings.focusTime
    var isPlaying = false
    let button = UIButton()
    var timerMode: mode = .Focus
    var timer: Timer?
    var today: String
    let playButton = UIButton()
    let stopButton = UIButton()
    let stackView = UIStackView()
    let motivationLabel = UILabel()
    let timeLabel = UILabel()
    let circleView = CircleProgressView(frame: CGRect(x: 0, y: 0, width: 248, height: 248))
    let circleProgressView = CircleProgressView(frame: CGRect(x: 0, y: 0, width: 248, height: 248))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        date = settings.focusTime
        timeLabel.text = date.toString()
    }
    
    init() {
        today = Date().getDay()
        var arr: [String] = UserDefaults.standard.object(forKey: "days") as? [String] ?? []
        if !arr.contains(today) {
            arr.append(today)
        }
        UserDefaults.standard.setValue(arr, forKey: "days")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func calculatePercentage(bigDate: Date, smallDate: Date) -> CGFloat {
        return CGFloat(bigDate.getSeconds() - smallDate.getSeconds()) / CGFloat(bigDate.getSeconds())
    }
    
    func updateTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.date = self.date.addingTimeInterval(-1)
            self.timeLabel.text = self.date.toString()
            self.circleProgressView.setProgress(self.calculatePercentage(bigDate: self.timerMode == .Focus ? self.settings.focusTime : self.settings.breakTime, smallDate: self.date))
            self.check()
        }
    }
    
    func check() {
        if date.getSeconds() < 1 {
            var history = UserDefaults.standard.object(forKey: today) as? [String: Int] ?? ["Focus time": 0, "Break time": 0]
            switch timerMode {
            case .Focus:
                history["Focus time"]! += settings.focusTime.getSeconds()
                UserDefaults.standard.setValue(history, forKey: today)
                date = settings.breakTime
                timerMode = .Break
                motivationLabel.text = "Break"
            case .Break:
                history["Break time"]! += settings.breakTime.getSeconds()
                UserDefaults.standard.setValue(history, forKey: today)
                date = settings.focusTime
                timerMode = .Focus
                motivationLabel.text = "Focus on your task"
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    func setupUI() {
        [button, playButton, stopButton, stackView, motivationLabel, timeLabel, circleView, circleProgressView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        circleView.setProgress(1)
        circleProgressView.setProgress(calculatePercentage(bigDate: settings.focusTime, smallDate: date))
        
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
        
        playStopButtonConfiguration(playButton, imageName: isPlaying ? "pause" : "play", pointSize: 25)
        playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        
        playStopButtonConfiguration(stopButton, imageName: "stop.fill", pointSize: 20)
        stopButton.addTarget(self, action: #selector(stopButtonPressed), for: .touchUpInside)
        
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
    
    @objc func playButtonPressed() {
        isPlaying.toggle()
        let image = UIImage(systemName: isPlaying ? "pause" : "play", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .bold))
        playButton.setImage(image, for: .normal)
        isPlaying ? updateTimer() : stopTimer()
    }
    
    @objc func stopButtonPressed() {
        var historyToday: [String: Int] = UserDefaults.standard.object(forKey: today) as? [String: Int] ?? ["Focus time": 0, "Break time": 0]
        switch timerMode {
        case .Focus:
            historyToday["Focus time"]! += settings.focusTime.getSeconds() - date.getSeconds()
            date = settings.focusTime
        
        case .Break:
            historyToday["Break time"]! += settings.breakTime.getSeconds() - date.getSeconds()
            date = settings.breakTime
        }
        UserDefaults.standard.setValue(historyToday, forKey: today)
//        isPlaying = false
    }
    
    
}

//MARK: CIRCLE PROGRESS VIEW

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
        //        progressLayer.strokeColor = UIColor.white.cgColor
        progressLayer.lineWidth = 6.0
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeEnd = 0.0  // Initial progress
        
        layer.addSublayer(progressLayer)
    }
    
    func setProgress(_ progress: CGFloat) {
        progressLayer.strokeEnd = progress
        let strokeColor = progress == 1 ? UIColor(red: 1, green: 1, blue: 1, alpha: 0.3) : UIColor.white
        progressLayer.strokeColor = strokeColor.cgColor
    }
}

// MARK: EXTENSION DATE
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

// MARK: EXTENSION INT
extension Int {
    func toDate() -> String {
        let hours = self / 3600
        let minutes = self / 60
        let seconds = self % 60
        return hours == 0 ? String(format: "%02d:%02d", minutes, seconds) :
        String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
