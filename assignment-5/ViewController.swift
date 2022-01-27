//
//  ViewController.swift
//  assignment-5
//
//  Created by Sungwoong Kang on 2022/01/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var leftNumberField: UITextField!
    @IBOutlet private weak var rightNumberField: UITextField!
    
    @IBOutlet private weak var resultLabel: UILabel!
        
    // MARK: - Actions

    @IBAction func tapDivideButton(_ sender: UIButton) {
        // 左や右のテキストフィールドにカーソルが合っているままだとボタンを押したときに入力終了判定にならないため、
        // 入力強制終了させる。
        leftNumberField.endEditing(true)
        rightNumberField.endEditing(true)
        
        let leftNumber = Float(leftNumberField.text ?? "")
        let rightNumber = Float(rightNumberField.text ?? "")

        guard let leftDivideNumber = leftNumber else {
            showAlert(message: "左に正しく分子を入力してください")
            return
        }
        guard let rightDivideNumber = rightNumber else {
            showAlert(message: "割る数を入力してください")
            return
        }
        guard rightDivideNumber != 0 else {
            showAlert(message: "割る数には０を入力しないでください")
            return
        }
        resultLabel.text = "\(leftDivideNumber / rightDivideNumber)"
    }
    
    // MARK: - Function
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "課題5",
                                      message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

