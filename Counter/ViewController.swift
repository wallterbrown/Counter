//
//  ViewController.swift
//  Counter
//
//  Created by Всеволод Нагаев on 27.02.2024.
//

import UIKit

class ViewController: UIViewController {
var count = 0
    @IBOutlet weak var historyOfChanges: UITextView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var numberCount: UILabel!
    override func viewDidLoad() {
        numberCount.text = "\(count)"
        historyOfChanges.isEditable = false 
        super.viewDidLoad()
    }


    @IBAction func changeButton(_ sender: Any) {
        count += 1
        updateCountLabel()
        addToHistory("значение изменено на +1")
       
    
    }
    @IBAction func minusChangeButton(_ sender: Any) {
        if count > 0 {
            count -= 1
            updateCountLabel()
            addToHistory("значение изменено на -1")
        }else {
            addToHistory("попытка уменьшить значение счетчика ниже 0")
        }
        
    }
    
    @IBAction func resetButton(_ sender: Any) {
        count = 0
        
        updateCountLabel()
        addToHistory("значение сброшено")
    }
    
    func updateCountLabel() {
            numberCount.text = "\(count)"
        }
    
    func addToHistory(_ event: String) {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let dateString = formatter.string(from: Date())
            historyOfChanges.text.append("\n\(dateString): \(event)")
        }
    
}

