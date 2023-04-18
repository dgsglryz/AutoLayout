//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let redBox: UIView = {
    let red = UIView(frame:   CGRect.zero)
    red.backgroundColor = .red
    red.translatesAutoresizingMaskIntoConstraints = false
    return red
  }()
  
  private func createBox() -> UIView {
    let box = UIView(frame: CGRect.zero)
    box.backgroundColor = .blue
    box.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      box.widthAnchor.constraint(equalToConstant: 60),
      box.heightAnchor.constraint(equalToConstant: 60)
    ])
    return box
  }
  
  let purpleBox: UIView = {
    let purple = UIView(frame: CGRect.zero)
    purple.translatesAutoresizingMaskIntoConstraints = false
    purple.backgroundColor = .purple
    return purple
  }()
  
  let orangeBoxFirst: UIView = {
    let orange = UIView(frame: CGRect.zero)
    orange.translatesAutoresizingMaskIntoConstraints = false
    orange.backgroundColor = .orange
    return orange
  }()
  
  let orangeBoxSecond: UIView = {
    let orange = UIView(frame: CGRect.zero)
    orange.translatesAutoresizingMaskIntoConstraints = false
    orange.backgroundColor = .orange
    return orange
  }()
  
  let mainView: UIView = {
    let main = UIView()
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    setupLayout()
  }
  
  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    mainView.addSubview(redBox)
    mainView.addSubview(purpleBox)
    redBox.addSubview(orangeBoxFirst)
    redBox.addSubview(orangeBoxSecond)
    
    let top = createBox()
    let middle = createBox()
    let bottom = createBox()
    
    let boxStackView = UIStackView(arrangedSubviews: [top, middle, bottom])
    boxStackView.axis = .vertical
    boxStackView.alignment = .center
    boxStackView.distribution = .fillEqually
    boxStackView.spacing = 70
    
    view.addSubview(boxStackView)
    boxStackView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])
    
    NSLayoutConstraint.activate([
      purpleBox.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -70),
      purpleBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
      purpleBox.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6),
      purpleBox.heightAnchor.constraint(equalToConstant: 50)
    ])
    
    NSLayoutConstraint.activate([
      redBox.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
      redBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
      redBox.widthAnchor.constraint(equalToConstant: 160),
      redBox.heightAnchor.constraint(equalToConstant: 50)
    ])
    
    NSLayoutConstraint.activate([
      orangeBoxFirst.topAnchor.constraint(equalTo: redBox.topAnchor, constant: 10),
      orangeBoxFirst.leadingAnchor.constraint(equalTo: redBox.leadingAnchor, constant: 10),
      orangeBoxFirst.widthAnchor.constraint(equalToConstant: 80),
      orangeBoxFirst.heightAnchor.constraint(equalToConstant: 30)
    ])
    
    NSLayoutConstraint.activate([
      orangeBoxSecond.topAnchor.constraint(equalTo: redBox.topAnchor, constant: 10),
      orangeBoxSecond.leadingAnchor.constraint(equalTo: orangeBoxFirst.trailingAnchor, constant: 10),
      orangeBoxSecond.widthAnchor.constraint(equalToConstant: 50),
      orangeBoxSecond.heightAnchor.constraint(equalToConstant: 30)
    ])
    
    NSLayoutConstraint.activate([
      boxStackView.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -700),
      boxStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -300),
      boxStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
    ])
    
  }
  
  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

