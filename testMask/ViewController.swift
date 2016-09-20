//
//  ViewController.swift
//  testMask
//
//  Created by www on 16/5/24.
//  Copyright © 2016年 www. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var image1:UIImageView!
    var image2:UIImageView!
    var mask:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image1 = UIImageView(frame: CGRectMake(200, 200, 200, 500))
        image1.image = UIImage(named: "test")
        
        image2 = UIImageView(frame: CGRectMake(200, 200, 200, 500))
        image2.image = UIImage(named: "dz")
        
        self.view.addSubview(image2)
        self.view.addSubview(image1)
        
        mask = UIView(frame: image1.bounds)

        var flag = 1
        for i in Range(start: 0, end: 2) {
            for j in Range(start: 0, end: 5) {
                
                let temp = UIView(frame:CGRectMake(CGFloat(i)*100,CGFloat(j)*100,100,100))
                temp.backgroundColor = UIColor.yellowColor()
                temp.tag = flag++
                mask.addSubview(temp)
            }
        }
        image1.maskView = mask
                
        testAnimation()
        
    }

    var flag1 = 1
    func testAnimation() {
        
        let show = image1.maskView?.viewWithTag(flag1++)
        UIView.animateWithDuration(0.6, delay: 0, options: .CurveLinear, animations: { () -> Void in
            show?.alpha = abs(show!.alpha - 1)
            }, completion: { (finish) -> Void in
                if self.flag1 <= 11 {
                    self.testAnimation()
                }
                else {
                    self.flag1 = 1
                    self.testAnimation()
                }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

