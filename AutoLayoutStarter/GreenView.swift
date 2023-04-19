//
//  GreenView.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2023-04-18.
//  Copyright © 2023 Derrick Park. All rights reserved.
//

import UIKit

class GreenView: UIView {
  
  let purpleView: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = .purple
    return v
  }()
  
  let orangeView: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = .orange
    let red1 = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 50))
    red1.backgroundColor = .red
    red1.translatesAutoresizingMaskIntoConstraints = false
    v.addSubview(red1)
    let red2 = UIView(frame: CGRect(x: 120, y: 10, width: 70, height: 50))
    red2.backgroundColor = .red
    red2.translatesAutoresizingMaskIntoConstraints = false
    v.addSubview(red2)
    return v
  }()
  
  init() {
    super.init(frame: CGRect.zero)
    backgroundColor = .green
    translatesAutoresizingMaskIntoConstraints = false
    addSubview(purpleView)
    purpleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    purpleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    purpleView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    purpleView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
    
    addSubview(orangeView)
    orangeView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    orangeView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    orangeView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    orangeView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    
     
    let vStackView = UIStackView(arrangedSubviews: [createBlueBox(), createBlueBox(), createBlueBox()])
    vStackView.translatesAutoresizingMaskIntoConstraints = false
    vStackView.axis = .vertical
    vStackView.alignment = .fill
    vStackView.distribution = .equalSpacing
    addSubview(vStackView)
    vStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    vStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    vStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func createBlueBox() -> UIView {
    let v = UIView()
    v.backgroundColor = .blue
    v.translatesAutoresizingMaskIntoConstraints = false
    v.widthAnchor.constraint(equalToConstant: 50).isActive = true
    v.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    return v
  }
  
}
