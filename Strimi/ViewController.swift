//
//  ViewController.swift
//  Strimi
//
//  Created by Tyler Brown on 5/25/18.
//  Copyright © 2018 Strimi. All rights reserved.
//

import UIKit
import AWSMobileClient

//create the bacground view
let imageName = "strimiBackground.png"
let image = UIImage(named: imageName)
let imageView = UIImageView(image: image!)

let imageNameLoader = "strimiLogo.png"
let imageLoader = UIImage(named: imageNameLoader)
let imageViewLoader = UIImageView(image: imageLoader!)
var userStateString = "";

//create the front view

class ViewController: UIViewController {

    override func viewDidLoad() {
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        imageView.contentMode=UIViewContentMode.scaleAspectFill
        view.addSubview(imageView)
        
        imageViewLoader.frame = CGRect(x: (UIScreen.main.bounds.size.width-135)/2.0, y: (UIScreen.main.bounds.size.height-70)/2.0, width: 135, height: 70)
        imageViewLoader.contentMode=UIViewContentMode.scaleAspectFill
        view.addSubview(imageViewLoader)
        
        
        
        super.viewDidLoad()
        AWSMobileClient.sharedInstance().initialize { (userState, error) in
            if let userState = userState
            {
                print("UserState: \(userState.rawValue)")
                userStateString=userState.rawValue;
            }
            else if let error = error
            {
                print("error: \(error.localizedDescription)")
            }
        }
        self.firstAnimation()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func firstAnimation()
    {
        UIView.animate(withDuration: 0.5, animations: {
            imageViewLoader.frame = CGRect(x: (UIScreen.main.bounds.size.width-(135/2.0))/2.0, y: (UIScreen.main.bounds.size.height-(70/2.0))/2.0, width: 135/2.0, height: 70/2.0)
            //it get smaller first
        }, completion: {(finished: Bool) in
            // Completion
            self.secondAnimation()
        })
    }
    func secondAnimation()
    {
        UIView.animate(withDuration: 0.6, animations: {
            //gets bigger
            imageViewLoader.frame = CGRect(x: (UIScreen.main.bounds.size.width-(70*1.5))/2.0, y: (UIScreen.main.bounds.size.height-(70*1.5))/2.0, width: 135*1.5, height: 70*1.5)
        }, completion: {(finished: Bool) in
            // Completion
            self.thirdAnimation()
    })
    }
    func thirdAnimation()
    {
        UIView.animate(withDuration: 0.5, animations: {
            //gets smaller
                imageViewLoader.frame = CGRect(x: (UIScreen.main.bounds.size.width-(135/2.0))/2.0, y: (UIScreen.main.bounds.size.height-(70/2.0))/2.0, width: 135/2.0, height: 70/2.0)
        }, completion: {(finished: Bool) in
            // Completion
            self.fourthAndFinalAnimation()
        })
    }
    func fourthAndFinalAnimation()
    {
        UIView.animate(withDuration: 0.5, animations: {
            //gets bigger to original
             imageViewLoader.frame = CGRect(x: (UIScreen.main.bounds.size.width-135)/2.0, y: (UIScreen.main.bounds.size.height-70)/2.0, width: 135, height: 70)
           
        }, completion: {(finished: Bool) in
            // Completion
            //segue to the actual login screen or the uitab bar
            //loadingToHomeScreen
            if(userStateString=="signedIn")
            {
                //StartToIn
                self.performSegue(withIdentifier: "StartToIn", sender: nil)
            }
            else
            {
            self.performSegue(withIdentifier: "loadingToHomeScreen", sender: nil)
            }
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

