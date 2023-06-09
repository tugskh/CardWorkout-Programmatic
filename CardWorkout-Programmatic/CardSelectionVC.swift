//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Tugs Khaliunbat on 5/27/23.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView = UIImageView()
    let stopButton = CWButton(color: .systemRed, title: "Stop!", systemImageName: "stop.circle")
    let resetButton = CWButton(color: .systemGreen, title: "Reset", systemImageName: "arrow.clockwise.circle")
    let rulesButton = CWButton(color: .systemBlue, title: "Rules", systemImageName: "list.bullet")
    
    var cards: [UIImage] = CardDeck.allValues
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc func stopTimer() {
        timer.invalidate()
    }
    
    @objc func resetTimer() {
        stopTimer()
        startTimer()
    }

    
    @objc func showRandomCard() {
        cardImageView.image = cards.randomElement()
    }
    

    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }
    
    
    func configureCardImageView() {
        view.addSubview(cardImageView) // dragging in cardImageView to the view
        cardImageView.translatesAutoresizingMaskIntoConstraints = false // Use autolayout
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    
    func configureStopButton() {
        view.addSubview(stopButton) // dragging in the stop button
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside) // added target for stop button
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30) // pinning to the bottom of the cardImageView
        ])
    }
    
    
    func configureResetButton() {
        view.addSubview(resetButton) // dragging in the reset button
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor), // pinning where the stop button starts
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20) // pinning to the bottom of stop button
        ])
    }
    
    
    func configureRulesButton() {
        view.addSubview(rulesButton) // dragging in the rules button
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20) // pinning to the bottom of stop button
        ])
    }
    
    
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)  // Rules button animation
    }
}
