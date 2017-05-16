//
//  AddViewController.swift
//  WordListStudy3
//
//  Created by Koki Ide on 2017/05/16.
//  Copyright © 2017 kokiide. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if saveData.array(forKey: "WORD") != nil /* != means "doesn't equal" */ {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveWord() {
        let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]

        wordArray.append(wordDictionary) //appendで、要素を追加！
        saveData.set(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title: "保存完了",
          message: "単語の保存が完了しました",
   preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
            ))
        
        self.present(alert, animated:true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
}//added "}" to get rid of error underneath
}
