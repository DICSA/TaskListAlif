//
//  TaskScreenView.swift
//  TaskList
//
//  Created by Белов Руслан on 21/08/23.
//

import Foundation
import UIKit
import SnapKit
import KeychainSwift

final class TaskScreenViewController: UIViewController {

    private let labelTextTask: UILabel = {
        let labelTextTask = UILabel()
        labelTextTask.text = "Продолжение следует"
        return labelTextTask
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
}

extension TaskScreenViewController {

    func setup() {
        settingsNavigationBar()
        addToSubViews()
        makeConstraints()
    }

    func settingsNavigationBar() {
        navigationItem.title = "TaskScreen"
        navigationItem.hidesBackButton = true
    }

    func addToSubViews() {
        view.addSubview(labelTextTask)

    }

    func makeConstraints() {
        labelTextTask.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
