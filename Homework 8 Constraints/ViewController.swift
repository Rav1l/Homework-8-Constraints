//
//  ViewController.swift
//  Homework 8 Constraints
//
//  Created by Ravil Gubaidulin on 29.10.2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    
    private lazy var leftLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.text = "Otus"
        lable.textAlignment = .center
        lable.backgroundColor = .tintColor.withAlphaComponent(0.1)
        lable.setContentHuggingPriority(.defaultLow, for: .horizontal)
        lable.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return lable
    }()
    
    private lazy var rightLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.text = "ru"
        lable.textAlignment = .center
        lable.backgroundColor = .green.withAlphaComponent(0.1)
        lable.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        lable.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return lable
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImage(named: "otus")
        let imageView = UIImageView(image: image)
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return imageView
    }()

    
    private lazy var edgeConstraint = CGFloat(20)
    
    private lazy var portraitConstraints = [
        //image constraits
        self.image.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -self.view.frame.height/10),
        self.image.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        
        //leftLable constraits
        self.leftLable.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 10),
        self.leftLable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.edgeConstraint),
        self.leftLable.trailingAnchor.constraint(equalTo: self.rightLable.leadingAnchor, constant: -self.edgeConstraint),
        
        //rigtLable constraits
        self.rightLable.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 10),
        self.rightLable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.edgeConstraint),
    ]
    
    private lazy var landscapeConstraints = [
        //image constraits
        self.image.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
        self.image.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
        
        //leftLable constraits
        self.leftLable.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        self.leftLable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.edgeConstraint),
        self.leftLable.trailingAnchor.constraint(equalTo: self.image.leadingAnchor, constant: -self.edgeConstraint),
        
        //rigtLable constraits
        self.rightLable.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        self.rightLable.leadingAnchor.constraint(equalTo: self.image.trailingAnchor, constant: self.edgeConstraint),
        self.rightLable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.edgeConstraint),
    ]
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    
        self.setupConstraints()
    }
    
    //MARK: - Methods
    
    private func setupView() {
        self.view.backgroundColor = .white
        
        [
            self.leftLable,
            self.rightLable,
            self.image
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
    }
    
    private func setupConstraints() {
        
        if UIDevice.current.orientation.isLandscape {
            NSLayoutConstraint.deactivate(portraitConstraints)
            NSLayoutConstraint.activate(landscapeConstraints)
        } else {
            NSLayoutConstraint.deactivate(landscapeConstraints)
            NSLayoutConstraint.activate(portraitConstraints)
        }
    }
    
    
}

