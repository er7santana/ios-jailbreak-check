//
//  MainViewController.swift
//  JailbreakTester
//
//  Created by Eliezer Rodrigo Beltramin de Santana (P) on 28/10/21.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30.0)
        
        return label
    }()
    
    lazy var checkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Am I jaibroken?", for: .normal)
        button.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(checkButton)
        checkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        checkButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(resultLabel)
        resultLabel.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 20.0).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func checkButtonTapped() {
        checkIfIsJailbroken()
    }
    
    func checkIfIsJailbroken() {
        
        if UIDevice.current.isJailBroken {
            resultLabel.text = "YES"
            view.backgroundColor = .systemRed
        } else {
            resultLabel.text = "NO"
            view.backgroundColor = .systemGreen
        }
        
    }
}
