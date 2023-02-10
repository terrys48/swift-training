//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Lefteris Kostakis on 7/2/23.
//

import UIKit

@propertyWrapper
struct LimitRange {
    private var number: Int
    var minValue: Int = 0
    var maxValue: Int = 100
    var wrappedValue: Int {
        get { number }
        set { number = min(max(newValue, minValue), maxValue) }
    }
    
    init(wrappedValue: Int, minValue: Int, maxValue: Int) {
        number = min(max(wrappedValue, minValue), maxValue)
        self.minValue = minValue
        self.maxValue = maxValue
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var slider: UISlider! // helping var in order to set slider at 50
    @LimitRange(minValue: 0, maxValue: 100) private var sliderValue: Int = 50
    private var targetValue: Int = 0
    private var computeScore: Int {
        get { 100 - abs(Int(slider.value) - targetValue) }
    }
    private var roundCounter: Int = 0
    
    @IBOutlet weak var roundLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startingNewGame()
    }

    func startingNewGame() {
        roundCounter += 1 // to the next round..
        roundLabel.text = "Round: \(roundCounter)"
        slider.value = 50 // init the slider to the middle
        targetValue = Int.random(in: 0...100)
        labelValue.text = "Put the Bull's eye as close as you can to: \(targetValue)"
    }

    @IBAction func hitMeTapped(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Scoreboard",
            message: "Your score is: \(computeScore)",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in self.startingNewGame() })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func adjustSlider(_ sender: UISlider) {
        sliderValue = Int(sender.value)
    }
    
}
