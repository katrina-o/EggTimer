//
//  ViewController.swift
//  EggTimer
//
//  Created by Катя on 18.06.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var timer = Timer()
    let eggTimes = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
    var totalTime = 0
    var secondsPassed = 0
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.alignment = .fill
        stack.distribution = .fillEqually
       
        return stack
    }()
    
    let titleView: UIView = {
        let view = UIView()
        return view
    }()
    
    var titleLabelTop: UILabel = {
        let view = UIView()
        let label = UILabel()
        label.text = "How do you like your eggs?"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    let eggStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .fill
        stack.distribution = .fillEqually
       
        return stack
    }()
    
    let softEggView:UIView = {
        let view = UIView()
        return view
    }()
    
    let imageSoft: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "soft_egg")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let buttonSoft: UIButton = {
        let button = UIButton()
        button.setTitle("Soft", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget (self, action: #selector(hardnessSelected), for: .touchUpInside)
        return button
    }()
    
    let mediumEggView:UIView = {
        let view = UIView()
        return view
    }()
    
    let imageMedium: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "medium_egg")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let buttonMedium: UIButton = {
        let button = UIButton()
        button.setTitle("Medium", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget (self, action: #selector(hardnessSelected), for: .touchUpInside)
        return button
    }()
    
    let hardEggView:UIView = {
        let view = UIView()
        return view
    }()
    
    let imageHard: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "hard_egg")
        image.contentMode = .scaleAspectFit
        return image
    }()
    let buttonHard: UIButton = {
        let button = UIButton()
        button.setTitle("Hard", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget (self, action: #selector(hardnessSelected), for: .touchUpInside)
        return button
    }()
    
    let timerView: UIView = {
        let view = UIView()
        return view
    }()
    
    var progressBar: UIProgressView = {
        var progressBar = UIProgressView()
        progressBar.progress = 0.0
        return progressBar
    }()
    
    
    @objc func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabelTop.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(updateTimer), userInfo:nil, repeats:true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
           print(Float(secondsPassed) / Float(totalTime))
            
        } else {
            timer.invalidate()
            titleLabelTop.text = "DONE"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        // Do any additional setup after loading the view.
    }
    func initialize() {
        view.backgroundColor = .cyan
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(titleView)
        
        titleView.addSubview(titleLabelTop)
        titleView.backgroundColor = .red
        
        stackView.addArrangedSubview(eggStack)
        eggStack.backgroundColor = .black
        eggStack.addArrangedSubview(softEggView)
        eggStack.addArrangedSubview(mediumEggView)
        eggStack.addArrangedSubview(hardEggView)
        
        softEggView.addSubview(imageSoft)
        softEggView.addSubview(buttonSoft)
        
        mediumEggView.addSubview(imageMedium)
        mediumEggView.addSubview(buttonMedium)
        
        
        hardEggView.addSubview(imageHard)
        hardEggView.addSubview(buttonHard)
        
        stackView.addArrangedSubview(timerView)
        timerView.addSubview(progressBar)
        
        
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        
        titleLabelTop.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        softEggView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
        }
        imageSoft.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        buttonSoft.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        mediumEggView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        imageMedium.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        buttonMedium.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        hardEggView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
        }
        imageHard.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        buttonHard.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        timerView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        
        }
        progressBar.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.center.equalToSuperview()
            make.width.equalTo(1)
        }
    }
    
    
    
}
