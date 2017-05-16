//
//  QuestionViewController.swift
//  WordListStudy3
//
//  Created by Koki Ide on 2017/05/16.
//  Copyright © 2017 kokiide. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    var isAnswered: Bool = false //回答したか・次の問題に行くかを判定
    var wordArray: [Dictionary<String, String>] = [] //UserDefaultから取る関数
    var shuffledWordArray: [Dictionary<String, String>] = []  //shuffleされた配列
    var nowNumber: Int = 0 //現在の回答数
    
    let saveData = UserDefaults.standard

    //viewがロードしてる時に行われる
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //viewが現れた時に呼ばれる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        //問題をシャッフル
        shuffle()
        questionLabel.text = shuffledWordArray[nowNumber]["english"]
    }
    
    func shuffle() {
        while wordArray.count > 0 {
            let index = Int(arc4random()) % wordArray.count
            shuffledWordArray.append(wordArray[index])
            wordArray.remove(at: index)
        }
    }
    
    @IBAction func nextButtonTapped() {
        //回答したか
        if isAnswered {
            //次の問題へ
            nowNumber += 1
            // nowNumber = nowNumber + 1　と同様
            answerLabel.text = ""
            
            //次の問題を表示するか
            if nowNumber < shuffledWordArray.count {
                //次の問題を表示
                questionLabel.text = shuffledWordArray[nowNumber]["english"]
                //isAnswerdをfalseにする
                isAnswered = false
                //ボタンのタイトルを変更
                nextButton.setTitle("答えを表示", for: .normal)
            } else {
            //答えを表示する
            answerLabel.text = shuffledWordArray[nowNumber]["japanese"]
                //isAnsweredをtrueにする
            isAnswered = true
                //ボタンのタイトルを変更
                nextButton.setTitle("次へ", for: .normal)
            }
        }
    }


}
