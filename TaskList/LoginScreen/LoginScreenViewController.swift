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

final class LoginScreenViewController: UIViewController {

    private var keychain = KeychainSwift(keyPrefix: "Registration_")

    private let userTextField: UITextField = {
        var userTextField = UITextField()
        userTextField.placeholder = "Login"
        userTextField.backgroundColor = UIColor.lightGray
        userTextField.borderStyle = .roundedRect
        userTextField.layer.cornerRadius = 10
        return userTextField
    }()

    private let passwordTextField: UITextField = {
        var passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = UIColor.lightGray
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.cornerRadius = 10
        return passwordTextField
    }()

    lazy private var enterBottonLoginScreen: UIButton = {
        var enterBottonLoginScreen = UIButton(type: .system)
        enterBottonLoginScreen.setTitle("Войти", for: .normal)
        enterBottonLoginScreen.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        enterBottonLoginScreen.setTitleColor(.black, for: .normal)
        enterBottonLoginScreen.backgroundColor = UIColor.init(hexString: "3EB7AC")
        enterBottonLoginScreen.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        enterBottonLoginScreen.layer.cornerRadius = 10
        enterBottonLoginScreen.layer.borderWidth = 2
        enterBottonLoginScreen.layer.borderColor = UIColor.black.cgColor
        enterBottonLoginScreen.addTarget(self, action: #selector (enterBottonTapped), for: .touchUpInside)
        return enterBottonLoginScreen
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }

    @objc func enterBottonTapped() {
        UIView.animate(withDuration: 0.2, animations: {
            self.enterBottonLoginScreen.transform = CGAffineTransform(scaleX: 1.1, y: 1.2)
        }) { (completed) in
            UIView.animate(withDuration: 0.2) {
                self.enterBottonLoginScreen.transform = .identity
            }
        }
        if (userTextField.text != nil) == (keychain.get(userTextField.text!) != nil) &&  passwordTextField.text == keychain.get(passwordTextField.text!){
            let TaskScreenViewController = TaskScreenViewController()
//            present(TaskScreenViewController, animated: true, completion: nil)
            navigationController?.pushViewController(TaskScreenViewController, animated: true)
        } else {
            let alert = UIAlertController(title: " ❌ Логин или пароль не верные", message: "Проверьте корректность введенных данных", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

    }
}

extension LoginScreenViewController {

    func setup() {
        addToSubViews()
        makeConstraints()
    }

    func addToSubViews() {
        view.addSubview(userTextField)
        view.addSubview(passwordTextField)
        view.addSubview(enterBottonLoginScreen)

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
        enterBottonLoginScreen.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(60)
        }
    }
}
