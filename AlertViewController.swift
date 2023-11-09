//
//  AlertViewController.swift
//  Swift test
//
//  Created by Sergio SergioArturoSolorzanoVazquez on 08/11/23.
//

import UIKit

class AlertViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupExitButton()
        setupCenterElement()
        addButtons(titles: ["Button 1", "Button 2"])
    }
    
    private func setupExitButton() {
        let exitButton = UIButton(type: .system)
        exitButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        exitButton.tintColor = .gray
        exitButton.contentMode = .scaleAspectFit
        exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        
        view.addSubview(exitButton)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            exitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            exitButton.widthAnchor.constraint(equalToConstant: 40),
            exitButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupCenterElement() {
        let iconImageView = UIImageView(image: UIImage(named: "planet"))
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        let viewWidth = self.view.frame.width
        let imageSize = viewWidth/3
        iconImageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true

        let titleLabel = UILabel()
        titleLabel.text = "Alert Title"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        let bodyLabel = UILabel()
        bodyLabel.text = "This is the body of the alert message. It can support multiple lines of text."
        bodyLabel.font = UIFont.systemFont(ofSize: 18)
        bodyLabel.textAlignment = .center
        bodyLabel.numberOfLines = 0
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel, bodyLabel])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: (-imageSize*0.3)),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func addButtons(titles: [String]) {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 16
        
        for title in titles {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.backgroundColor = .systemBlue
            button.tintColor = .white
            button.layer.cornerRadius = 8
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            
            buttonStackView.addArrangedSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 48)
            ])
        }
        
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width * 0.05),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.width * 0.05),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    @objc private func exitButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func buttonTapped() {
        // Handle button tap event
    }
}
