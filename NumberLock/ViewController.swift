//
//  ViewController.swift
//  NumberLock
//
//  Created by 林奕德 on 2017/10/14.
//  Copyright © 2017年 AppsAdamLin. All rights reserved.
//

import UIKit
import GameKit
class ViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var iputerTextFieldKey: UITextField!
    var answer =     GKRandomSource.sharedRandom().nextInt(upperBound: 100)+1 //取亂數
    var numberMax = 100
    var numberMin = 1
    var isOver = false // 因為已進入遊戲 所以先呈現false
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent// 狀態列顯示為白色
    }
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      self.view.endEditing(true) // 使用手勢操作隱藏虛擬鍵盤
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    } //按下return隱藏鍵盤
    
    @IBOutlet weak var background: UIImageView! //背景圖
    @IBAction func makeAguess(_ sender: UIButton) {
        if isOver == false {
            //playing Game
            print(answer)
            //take input text out
            let inputText = inputTextField.text!
            // print("inputText = \(inputText)")
            inputTextField.text = "" //clear textfield
            let  inputNumber =   Int(inputText)
            if inputNumber == nil {
                // print("wrong input")
                messageLabel.text = "no input! Guessa number between \(numberMin)~\(numberMax)"
                
            } else{
                if  inputNumber! > numberMax {
                    //print("too large")
                    messageLabel.text = "too larage! Guess a number between \(numberMin)~\(numberMax)"
                }else if inputNumber! < numberMin {
                    //print("too small")
                    messageLabel.text = "too small! Guess a number between \(numberMin)~\(numberMax)"
                }else if inputNumber == answer {
                    messageLabel.text = "You are right, press [Guess] to play again!"
                    isOver = true
                    background.image =  UIImage(named: "Finish")//名稱一定得相同
                }else {
                    // messageLabel.text = "You are wrong, try again"
                    //print("check answer")
                    if inputNumber! > answer{
                        //large the answer
                        numberMax = inputNumber!
                    }else{
                        //smaller the answer
                        numberMin = inputNumber!
                    }
                    messageLabel.text = "try again! Guess a number between \(numberMin)~\(numberMax)"
                }
            }
        }else {
            //game is over
            numberMax = 100
            numberMin = 1
            messageLabel.text = "Guess a number between \(numberMin)~\(numberMax)"
            answer =     GKRandomSource.sharedRandom().nextInt(upperBound: 100)+1 //取亂數
            isOver = false
            background.image =  UIImage(named: "BG")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.becomeFirstResponder()
       
        //push the keyborard up
        // Do any additional setup after loading the view, typically from a nib.
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

