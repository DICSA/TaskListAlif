//
//  ViewController.swift
//  TaskList
//
//  Created by Белов Руслан on 16/08/23.
//

import UIKit
import SnapKit
import SwiftGifOrigin
import AuthenticationServices


final class LoginAndRegistrationViewController: UIViewController {

    private let imageToDoList = UIImage(named: "imageToDoList")

    lazy var imageViewToDoList: UIImageView? = {
        guard let imageToDoList = imageToDoList else {
            return nil
        }
        let iconView = UIImageView(image: imageToDoList)
        iconView.contentMode = .scaleAspectFill
        iconView.clipsToBounds = true
        return iconView
    }()

    lazy private var enterBotton: UIButton = {
        var enterBotton = UIButton(type: .system)
        enterBotton.setTitle("Войти", for: .normal)
        enterBotton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        enterBotton.setTitleColor(.black, for: .normal)
        enterBotton.backgroundColor = UIColor.init(hexString: "3EB7AC")
        enterBotton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        enterBotton.layer.cornerRadius = 10
        enterBotton.layer.borderWidth = 2
        enterBotton.layer.borderColor = UIColor.black.cgColor
        enterBotton.addTarget(self, action: #selector (enterBottonTapped), for: .touchUpInside)
        return enterBotton
    }()

    lazy private var registrationBotton: UIButton = {
        var registrationBotton = UIButton(type: .system)
        registrationBotton.setTitle("Регистрация", for: .normal)
        registrationBotton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        registrationBotton.setTitleColor(.black, for: .normal)
        registrationBotton.backgroundColor = .orange
        registrationBotton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        registrationBotton.layer.cornerRadius = 10
        registrationBotton.layer.borderWidth = 2
        registrationBotton.layer.borderColor = UIColor.black.cgColor
        registrationBotton.addTarget(self, action: #selector (registrationBottonTapped), for: .touchUpInside)
        return registrationBotton
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }


    // MARK: - objc Func
    @objc func enterBottonTapped() {
        UIView.animate(withDuration: 0.2, animations: {
            // Изменяем размер кнопки, делаем ее больше
            self.enterBotton.transform = CGAffineTransform(scaleX: 1.1, y: 1.2)
        }) { (completed) in
            UIView.animate(withDuration: 0.2) {
                self.enterBotton.transform = .identity
            }
        }
        let loginScreenViewController = LoginScreenViewController()
        navigationController?.pushViewController(loginScreenViewController, animated: true)
    }

    @objc func registrationBottonTapped() {
        UIView.animate(withDuration: 0.2, animations: {
            self.enterBotton.transform = CGAffineTransform(scaleX: 1.1, y: 1.2)
        }) { (completed) in
            UIView.animate(withDuration: 0.2) {
                self.enterBotton.transform = .identity
            }
        }
        let RegistrationScreenViewController = RegistrationScreenViewController()
        navigationController?.pushViewController(RegistrationScreenViewController, animated: true)
    }
}


extension LoginAndRegistrationViewController {

    func setup() {
        addToSubViews()
        makeConstraints()
    }

    func addToSubViews() {
        view.addSubview(imageViewToDoList ?? UIImageView())
        view.addSubview(enterBotton)
        view.addSubview(registrationBotton)
    }

    func makeConstraints() {
        imageViewToDoList?.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(130)
            $0.size.equalTo(200)
        }
        enterBotton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageViewToDoList!.snp.bottom).offset(40)
        }
        registrationBotton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(enterBotton.snp.bottom).offset(20)
        }
    }
    
}
