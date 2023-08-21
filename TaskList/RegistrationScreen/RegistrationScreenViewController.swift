//
//  MainScreenViewVC.swift
//  TaskList
//
//  Created by Белов Руслан on 17/08/23.
//

import Foundation
import UIKit
import SnapKit
import KeychainSwift

final class RegistrationScreenViewController: UIViewController {

    private var keychain = KeychainSwift(keyPrefix: "Registration_")


    private var passwordText = [String]()
    private var repeatPasswordText = [String]()

    private let userTextField: UITextField = {
        var userTextField = UITextField()
        userTextField.placeholder = "Login"
        userTextField.backgroundColor = UIColor.lightGray
        userTextField.borderStyle = .roundedRect
        userTextField.layer.cornerRadius = 10
        return userTextField
    }()

    private lazy var passwordTextField: UITextField = {
        var passwordTextField = UITextField()
        passwordTextField.delegate = self
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = UIColor.lightGray
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.cornerRadius = 10
        return passwordTextField
    }()

    private lazy var repeatPasswordTextField: UITextField = {
        var repeatPasswordTextField = UITextField()
        repeatPasswordTextField.delegate = self
        repeatPasswordTextField.placeholder = "Repeat password"
        repeatPasswordTextField.backgroundColor = UIColor.lightGray
        repeatPasswordTextField.borderStyle = .roundedRect
        repeatPasswordTextField.layer.cornerRadius = 10
        return repeatPasswordTextField
    }()

    private lazy var emailTextField: UITextField = {
        var emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        emailTextField.backgroundColor = UIColor.lightGray
        emailTextField.borderStyle = .roundedRect
        emailTextField.layer.cornerRadius = 10
        return emailTextField
    }()

    lazy private var registrationUserBotton: UIButton = {
        var registrationUserBotton = UIButton(type: .system)
        registrationUserBotton.setTitle("Зарегистрироваться", for: .normal)
        registrationUserBotton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        registrationUserBotton.setTitleColor(.black, for: .normal)
        registrationUserBotton.backgroundColor = .orange
        registrationUserBotton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        registrationUserBotton.layer.cornerRadius = 10
        registrationUserBotton.layer.borderWidth = 2
        registrationUserBotton.layer.borderColor = UIColor.black.cgColor
        registrationUserBotton.addTarget(self, action: #selector (enterBottonTapped), for: .touchUpInside)
        return registrationUserBotton
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()

    }

    @objc func enterBottonTapped() {
        UIView.animate(withDuration: 0.2, animations: {
            self.registrationUserBotton.transform = CGAffineTransform(scaleX: 1.1, y: 1.2)
        }) { (completed) in
            UIView.animate(withDuration: 0.2) {
                self.registrationUserBotton.transform = .identity
            }
        }
        if passwordText.last == repeatPasswordText.last {
            print("ok")
            repeatPasswordTextField.backgroundColor = .green
            keychain.set(userTextField.text!, forKey: userTextField.text!)
            keychain.set(repeatPasswordText.last!, forKey: repeatPasswordText.last!)
        } else {
            let alert = UIAlertController(title: "❌ Пароли не совпадают", message: "Проверьте корректность введенных паролей", preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

            self.present(alert, animated: true, completion: nil)
            repeatPasswordTextField.backgroundColor = .red
        }
        
    }
}

private extension RegistrationScreenViewController {

    func setup() {
        settingsNavigationBar()
        addToSubViews()
        makeConstraints()
    }

    func settingsNavigationBar() {
        navigationItem.title = "Регистрация"
    }

    func addToSubViews() {
        view.addSubview(userTextField)
        view.addSubview(passwordTextField)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(emailTextField)
        view.addSubview(registrationUserBotton)

    }

    func makeConstraints() {

        userTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(200)
            $0.width.equalTo(200)
        }
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userTextField.snp.bottom).offset(30)
            $0.width.equalTo(200)
        }
        repeatPasswordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
            $0.width.equalTo(200)
        }
        emailTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(repeatPasswordTextField.snp.bottom).offset(30)
            $0.width.equalTo(200)
        }
        registrationUserBotton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailTextField.snp.bottom).offset(60)
        }
    }
}

extension RegistrationScreenViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
                if let currentText = textField.text {
                    let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
                    if textField == passwordTextField {
                        print(newText)
                        passwordText.append(newText)
                    } else if textField == repeatPasswordTextField {
                        print(newText)
                        repeatPasswordText.append(newText)
                    }
                }
        return true
    }
}
