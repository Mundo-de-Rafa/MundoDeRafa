//
//  StoryDefaultViewController.swift
//  MundoDeRafa
//
//  Created by Albert Rayneer on 24/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class StoryDefaultViewController: UIViewController {

    lazy var pauseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "pause_button"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(didTapPauseButton), for: .touchUpInside)
        return button
    }()
    
    lazy var instructionsLabel: PaddingLabel = {
        let label = PaddingLabel(withInsets: 8, 8, 24, 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.balsamiqB?.withSize(UIScreen.main.bounds.height * 0.04)
        label.backgroundColor = .backgroundWhite
        label.textColor = .primaryPurple
        label.textAlignment = .center
        label.layer.cornerRadius = UIScreen.main.bounds.height/24
        label.layer.masksToBounds = true
        label.numberOfLines = -1
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondaryPurple
        setupPauseButton()
        setupInstructionsLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showInstructionsLabel(with: "Hello World! I'm testing this label with a very big text, to see how big the text inside the label can be, and if it break the layout Hello World! I'm testing this label with a very big text, to see how big the text inside the label can be, and if it break the layou Hello World! I'm testing this label with a very big text, to see how big the text inside the label can be, and if it break the layou Hello World! I'm testing this label with a very big text, to see how big the text inside the label can be, and if it break the layou")
    }
    
    @objc func didTapPauseButton() {
        navigationController?.present(NextStoryViewController(), animated: true, completion: nil)
    }
    
    private func setupPauseButton() {
        view.addSubview(pauseButton)
        NSLayoutConstraint.activate([
            pauseButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            pauseButton.widthAnchor.constraint(equalTo: pauseButton.heightAnchor),
            pauseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.02),
            pauseButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: view.frame.width * -0.02)
        ])
    }
    
    private func setupInstructionsLabel() {
        view.addSubview(instructionsLabel)
        NSLayoutConstraint.activate([
            instructionsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height*0.08),
            instructionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            instructionsLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            instructionsLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
        instructionsLabel.alpha = 0
        instructionsLabel.isHidden = true
    }
    
    func showInstructionsLabel(with text: String) {
        instructionsLabel.text = text
        instructionsLabel.isHidden = false
        UIView.animate(withDuration: 0.5, animations: {
            self.instructionsLabel.alpha = 1
        }, completion: {_ in self.hideInstructionsLabel()})
    }
    
    func hideInstructionsLabel() {
        UIView.animate(withDuration: 4, animations: {
            self.instructionsLabel.alpha = 0
        }, completion: { _ in self.instructionsLabel.isHidden = true })
    }
}
