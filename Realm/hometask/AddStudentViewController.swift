//
//  AddStudentViewController.swift
//  json_test
//
//  Created by Anatolii on 7/15/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    var textFieldArray: [UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldArray = [nameTextField,
                          surnameTextField,
                          ageTextField,
                          sexTextField,
                          cityTextField]
        
    }
    
    func isEmptyFields() -> Bool {
        var isEmptyFields = false
        for field in textFieldArray {
            if field.text?.isEmpty ?? false {
                isEmptyFields =  true
            }
        }
        return isEmptyFields
    }
    
    func checkForInt() -> Bool {
        var isInt = true
        if !(ageTextField.text?.isEmpty ?? false) {
            let ageInt = Int(ageTextField.text ?? "")
            if ageInt == nil {
                isInt = false
            }
        }
        return isInt
    }
    
    func saveStudent() {
        let student = StudentRealm()
        student.name = nameTextField.text ?? ""
        student.surname = surnameTextField.text ?? ""
        student.age = Int(nameTextField.text ?? "") ?? 0
        student.city = cityTextField.text ?? ""
        student.sex = sexTextField.text ?? ""
        StudentRealmManager.sharedInstance.writeObject(realmObject: student)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Warning!", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        guard !isEmptyFields() else {
            alert.message = "Some fields are empty. Please fill"
            self.present(alert, animated: true)
            return
        }
        
        guard checkForInt() else {
            alert.message = "Age is not numeric. Please fix"
            self.present(alert, animated: true)
            return
        }
        saveStudent()
        alert.message = "Success"
        let vc = storyboard?.instantiateViewController(withIdentifier: "StudentListViewController") as! StudentListViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
