//
//  ViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 12/3/14.
//

import UIKit

class MainViewController: UIViewController,UIPickerViewDelegate,UIToolbarDelegate {
    
    var num = ["宛名を選択する","(株) Labit","(株) ゲームエイト","(同) Halfway","鶴田 浩之","今谷 祐通"]
    var toolBar: UIToolbar!
    var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField = UITextField(frame: CGRectMake(self.view.frame.size.width/0, 0, 200, 30))
        textField.layer.position = CGPointMake(self.view.bounds.width/2, 250)
        textField.placeholder = "宛名を選択する"
        textField.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(textField)
        
        var pickerView = UIPickerView()
        pickerView.showsSelectionIndicator = true
        pickerView.delegate = self
        
        textField.inputView = pickerView
        
        toolBar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = .BlackTranslucent
        toolBar.tintColor = UIColor.whiteColor()
        toolBar.backgroundColor = UIColor.blackColor()
        
        let toolBarBtn = UIBarButtonItem(title: "完了", style: .Bordered, target: self, action: "tappedToolBarBtn:")
        
        toolBarBtn.tag = 1
        toolBar.items = [toolBarBtn]
        
        textField.inputAccessoryView = toolBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
        return num.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return num[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = num[row]
    }
    
    func tappedToolBarBtn(sender: UIBarButtonItem) {
        textField.resignFirstResponder()
    }
    
}