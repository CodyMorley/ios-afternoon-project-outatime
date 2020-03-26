//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Bling Morley on 3/25/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTextView: UILabel!
    @IBOutlet weak var presentTextView: UILabel!
    @IBOutlet weak var lastTimeTextView: UILabel!
    @IBOutlet weak var speedTextView: UILabel!
    
    
     var dateFormatter: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateFormat = "MMMM dd, YYYY"
         formatter.timeZone = TimeZone(secondsFromGMT: 28800)
         return formatter
     }()
    
    var currentSpeed: Int = 0
    
    var timer: Timer?
    
    
    
    @IBAction func travelBack(_ sender: Any) {
        startTimer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTextView.text = dateFormatter.string(from: Date())
        speedTextView.text = "\(currentSpeed) MPH"
        lastTimeTextView.text = "--- -- ----"
        
        // Do any additional setup after loading the view.
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: updateSpeed(timer: ))
    }

    func resetTimer() {
        timer?.invalidate()
        timer = nil
        }
    
    func updateSpeed(timer: Timer) {
    
        if currentSpeed < 88 {
            currentSpeed += 1
            speedTextView.text = "\(currentSpeed) MPH"
        } else {
            resetTimer()
            lastTimeTextView.text = presentTextView.text
            presentTextView.text = destinationTextView.text
            currentSpeed = 0
            
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is: \(presentTextView.text ?? "not found")", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
            datePickerVC.delegate = self
        }
    }
    

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationWasChosen(_ date: Date) {
        destinationTextView.text = dateFormatter.string(from: date)
    }
    
    
    

}
