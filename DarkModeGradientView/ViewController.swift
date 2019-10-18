//
//  ViewController.swift
//  DarkModeGradientView
//
//  Created by David Perez on 1/4/19.
//  Copyright © 2019 David Perez P. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gradient = CAGradientLayer()
    var on = true
    let view1 : UIView = {
        let v = UIView()
        v.layer.masksToBounds = true
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return  v
    }()
    
    let infoView : UIView = {
       let i = UIView()
        i.layer.cornerRadius = 5
        i.backgroundColor = .white
        i.clipsToBounds = true
        i.translatesAutoresizingMaskIntoConstraints = false
       return i
    }()
    
    let button : UIButton = {
        let b = UIButton(type: UIButtonType.system)
        let image = UIImage(named: "moonIcon")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(image, for: UIControlState.normal)
        b.addTarget(self, action: #selector(changeColor), for: UIControlEvents.touchUpInside)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupViews()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        
        
        addGradientEffect(targetView: view1)
        
    }
    
    func addGradientEffect(targetView: UIView){
        gradient = CAGradientLayer()
        gradient.frame = targetView.frame
        
        gradient.colors = [GradientColors().oceanBlue, GradientColors().lightBlue, GradientColors().lightGreen]
        
        gradient.startPoint = CGPoint(x: 0.0,y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0,y: 1.0)
        targetView.layer.addSublayer(gradient)
    }
    
    
    func setupViews(){
        view.addSubview(view1)
        view.addSubview(button)
        view.addSubview(infoView)
        view1.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        view1.widthAnchor.constraint(equalToConstant: view.frame.width ).isActive = true
        view1.heightAnchor.constraint(equalToConstant: view.frame.height ).isActive = true
        view1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: view.frame.width*0.2).isActive = true
        button.heightAnchor.constraint(equalToConstant: view.frame.width*0.2).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        infoView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true
        infoView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.3).isActive = true
        infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    @objc
    func changeColor(){
        print("touched")
        
        if on {
            let animateColor = CABasicAnimation(keyPath: "colors")
            animateColor.duration = 0.5
            animateColor.toValue = [GradientColors().darkPurple, GradientColors().midPurple, GradientColors().darkBlue]
            animateColor.fillMode = kCAFillModeForwards
            animateColor.isRemovedOnCompletion = false
            gradient.add(animateColor, forKey: "hello")
            on = false
        } else if !on {
            let animateColor = CABasicAnimation(keyPath: "colors")
            animateColor.duration = 0.5
            animateColor.fromValue = [GradientColors().darkPurple, GradientColors().midPurple, GradientColors().darkBlue]
            animateColor.toValue = [GradientColors().oceanBlue, GradientColors().lightBlue, GradientColors().lightGreen]
            animateColor.fillMode = kCAFillModeForwards
            animateColor.isRemovedOnCompletion = false
            gradient.add(animateColor, forKey: "hello")
            on = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

