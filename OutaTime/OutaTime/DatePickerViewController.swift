//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Bling Morley on 3/25/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    
    
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        delegate?.destinationWasChosen(datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol DatePickerDelegate {
    func destinationWasChosen(_ date: Date)
}
