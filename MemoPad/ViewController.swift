//
//  ViewController.swift
//  MemoPad
//
//  Created by chuya nakamura23 on 2015/11/01.
//  Copyright (c) 2015年 chuyanakamura23. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{
      @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
        let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = saveData.objectForKey("title") as! String?
        contentTextView.text = saveData.objectForKey("content") as! String?
          titleTextField.delegate = self
        // Do any additional setup after loading the view.
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveMemo() {
        saveData.setObject(titleTextField.text, forKey: "title")
        saveData.setObject(contentTextView.text,forKey: "content")
        saveData.synchronize()
                let alert = UIAlertController(title: "タイトル",
            massage: "本文を入れます。",
        preferredStyle: UIAlertControllerStyle.Alert)(title: "保存",
        message: "メモの保存が完了しました。",
                )alert.addAction(
        UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.Default,
            handler: {action in
                //ボタンが押された時の操作
                NSLog("OKボタンが押されました!")
                
                self.navigationController?.popToRootViewControllerAnimated(true)
        }
                )
        )
            presentationController(alert,animateed: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool{
    textField.resignFirstResponder()
        return true
       }
    }
    
    
    
    
    
    
}
