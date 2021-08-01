//
//  LoginViewController.swift
//  Frendy App
//
//  Created by nilyina on 04.07.2021.
//
import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet private weak var titleImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
            // Второе — когда клавиатура пропадает
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //Отписываемся от уведомлений о клавиатуре:
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
           
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction private func loginButtonPressed(_ sender: UIButton) {
        //    Получаем текст логина
        guard
            let login = loginTextField.text,
        //Получаем текст-пароль
        let password  = passwordTextField.text
        
        else {
            print("Username or Password is required")
            return
        }
        
        //Проверяем, верны ли они
        if login == "admin" && password == "1234" {
            print("Successful authentication")
        } else {
            print("Authentication is failed!")
        }
    }
    
    //Клавиатура появляется
    @objc private func keyboardWasShown(notification: Notification) {
        
    //Получаем размер клавиатуры
    let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        //Добавляем отступ внизу UIScrollView равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исзчезает
    @objc private func keyboardWillBeHidden(notification: Notification) {
        
    //Устанавливаем отступ внизу UIScrollView равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    private func setViews() {
        titleImageView.layer.cornerRadius = 14
        loginButton.setTitle("Log In", for: .normal)
        loginButton.layer.cornerRadius = 8
        loginButton.setTitleColor(.init(red: 15, green: 115, blue: 233, alpha: 1), for: .highlighted)
        loginTextField.layer.cornerRadius = 8
        loginTextField.layer.borderWidth = 2
        loginTextField.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGesture)
    }
}
