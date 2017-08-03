//
//  ViewController.swift
//  Project15
//
//  Created by Radio Shaolin on 29.05.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var currentAnimation = 0
    
    @IBOutlet weak var tap: UIButton!
    
    @IBAction func tapped(_ sender: Any) {
        tap.isHidden = true
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], 
                                     animations: { [unowned self] in switch self.currentAnimation {
                                        case 0:
                                            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                                        case 1:
                                            self.imageView.transform = CGAffineTransform.identity
                                        case 2:
                                            self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
                                        case 3:
                                            self.imageView.transform = CGAffineTransform.identity
                                        case 4:
                                            self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                                        case 5:
                                            self.imageView.transform = CGAffineTransform.identity
                                        case 6:
                                            self.imageView.alpha = 0.1
                                            self.imageView.backgroundColor = UIColor.green
                                        case 7:
                                            self.imageView.alpha = 1
                                            self.imageView.backgroundColor = UIColor.clear
                                        default:
                                            break
                                        }
        }) { [unowned self] (finished: Bool) in self.tap.isHidden = false }
        
        currentAnimation += 1
        
        if currentAnimation > 7 { currentAnimation = 0 }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
}

