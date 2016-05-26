//
//  LoginViewController.swift
//  IMTest
//
//  Created by HouMeng on 16/5/23.
//  Copyright © 2016年 侯猛. All rights reserved.
//

import UIKit

//extension UIView {
//   @IBInspectable var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        
//        set {
//            layer.cornerRadius = newValue
//            layer.masksToBounds = (newValue > 0)
//        }
//    }
//}

class LoginViewController: UIViewController,RCAnimatedImagesViewDelegate {

    @IBOutlet weak var loginStackView: UIStackView!
    @IBOutlet weak var wallPaper: RCAnimatedImagesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.wallPaper.delegate = self
        self.wallPaper.startAnimating()
        
        
        // Do any additional setup after loading the view.
    }
    
    func animatedImagesNumberOfImages(animatedImagesView: RCAnimatedImagesView!) -> UInt {
        return 7
    }
    
    func animatedImagesView(animatedImagesView: RCAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {

        return UIImage(named: "\(index + 1)")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5) { () -> Void in
            self.loginStackView.axis = UILayoutConstraintAxis.Vertical
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
