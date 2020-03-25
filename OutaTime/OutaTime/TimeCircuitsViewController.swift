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
