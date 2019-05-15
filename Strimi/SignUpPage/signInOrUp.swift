//
//  signInOrUp.swift
//  Strimi
//
//  Created by Tyler Brown on 4/11/19.
//  Copyright © 2019 Strimi. All rights reserved.
//
//Next, in your application code where you wish to use the AppSync client (like your View Controller) reference this in the viewDidLoad()
import Foundation

import UIKit
import AWSAppSync
import AWSMobileClient
import AWSCognitoIdentityProvider

class signInOrUp: UIViewController {
    var appSyncClient: AWSAppSyncClient?
     var discard: Cancellable?
    let theCoolGreenColor = UIColor(red: CGFloat(79.0/255.0), green: CGFloat(197.0/255.0), blue: CGFloat(153.0/255.0), alpha: CGFloat(1.0))
    var bounds1 = UIScreen.main.bounds
    
    //this is the sign up or login screen
    var loginAndSignUpInformationView = UIView(frame: CGRect(x: 0, y: 327, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-317))
    
    var loginAndSignUpInformationViewSignUpButton = UIButton(frame: CGRect(x: 0, y: 27, width: UIScreen.main.bounds.size.width/2.0, height: 32))
    
  
     //this is the sign up information
    var loginAndSignUpInformationViewSignUpView = UIView(frame: CGRect(x: 0, y: 65, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-317-65))
    
    
    var loginAndSignUpInformationViewSignUpViewInstagram = UIButton(frame: CGRect(x: (UIScreen.main.bounds.size.width-282)/2.0, y: 137, width: 282, height: 40))
    var loginAndSignUpInformationViewSignUpViewSeperator = UIView(frame: CGRect(x: 0, y: 137+80, width: UIScreen.main.bounds.size.width, height: 1))
    var loginAndSignUpInformationViewSignUpViewPhone = UIButton(frame: CGRect(x: (UIScreen.main.bounds.size.width-282)/2.0, y: 137+80+33, width: 282, height: 40))
    
    
    //this is the login information
      var loginAndSignUpInformationViewLoginButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.size.width/2.0, y: 27, width: UIScreen.main.bounds.size.width/2.0, height: 32))
    
    var loginAndSignUpInformationViewLoginView =  UIView(frame: CGRect(x: 0, y: 65, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-317-65))
    //----Username
     var loginAndSignUpInformationViewLoginViewUserNameTextField = UITextField(frame: CGRect(x: 14, y: 29, width: UIScreen.main.bounds.size.width-14-14-30-14, height: 24))
    
     var loginAndSignUpInformationViewLoginViewUserNameTextFieldUnderline = UIView(frame: CGRect(x: 0, y: 29+44, width: UIScreen.main.bounds.size.width, height: 1))
    
     var loginAndSignUpInformationViewLoginViewUserNameIcon = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width-14-30, y: 29-3, width: 30, height: 30))
    //-----Password
    var loginAndSignUpInformationViewLoginViewPasswordTextField = UITextField(frame: CGRect(x: 14, y: 29+44+14, width: UIScreen.main.bounds.size.width-14-14-30-14, height: 24))
    
    var loginAndSignUpInformationViewLoginViewPasswordTextFieldUnderline = UIView(frame: CGRect(x: 0, y: 29+44+14+44, width: UIScreen.main.bounds.size.width, height: 1))
    
    var loginAndSignUpInformationViewLoginViewPasswordIcon = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width-14-30, y: 29+44+14-3, width: 30, height: 30))
    
    var loginAndSignUpInformationViewLoginViewForgotButton = UIButton(frame: CGRect(x: 0, y: 29+44+14+44+20, width: UIScreen.main.bounds.size.width, height: 18))
    
    var loginAndSignUpInformationViewLoginViewLoginButton = UIButton(frame: CGRect(x: (UIScreen.main.bounds.size.width-282)/2.0, y:29+44+14+44+20+60, width: 282, height: 40))
    
    //---Page for Phone
    
    var phoneView  = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50))
    var phoneViewLabel  = UILabel(frame: CGRect(x: (UIScreen.main.bounds.size.width-300)/2.0, y: 27, width: 300, height: 32))
    
     var phoneViewCountryCodeLabel  = UILabel(frame: CGRect(x: 38, y: 27+32+36, width: 46, height: 24))
    var phoneViewCountryCodeLabelVerticalSeperator  = UIView(frame: CGRect(x: 104, y: 27+32+35, width: 2, height: 30))
    
    var phoneViewCountryCodeLabelHorizontalSeperator  = UIView(frame: CGRect(x: 0, y: 27+32+35+40, width: UIScreen.main.bounds.size.width, height: 2))
    
    var phoneViewPhoneNumberTextField = UITextField(frame: CGRect(x: 124, y: 27+32+36, width: UIScreen.main.bounds.size.width-124-14, height: 24))
    var phoneViewPhoneNumberNextButton = UIButton(frame: CGRect(x: (UIScreen.main.bounds.size.width-282)/2.0, y: 27+32+35+40+40, width: 282, height: 40))
    
    
    var phoneViewHaveAnAcountLabel = UILabel(frame: CGRect(x: (UIScreen.main.bounds.size.width-210)/2.0, y: UIScreen.main.bounds.size.height-50-24-16, width: 155, height: 24))
    var phoneViewLoginButton = UIButton(frame: CGRect(x: ((UIScreen.main.bounds.size.width-210)/2.0)+155, y: UIScreen.main.bounds.size.height-50-24-16, width: 55, height: 24))
    
    //confiramation page
    var conformationPage = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50))
    
    var conformationPageLabel = UILabel(frame: CGRect(x: 20, y: 27, width: UIScreen.main.bounds.size.width-40, height: 32))
    
    var conformationPageLabelDescription = UILabel(frame: CGRect(x: 20, y: 27+32+34, width: UIScreen.main.bounds.size.width-40, height: 48))
    var conformationPageRequestNewOneButton = UIButton(frame: CGRect(x: (UIScreen.main.bounds.size.width-300)/2.0, y: 27+32+34+48, width: 300, height: 24))
    var conformationPageTextField = UITextField(frame: CGRect(x: 40, y: 27+32+34+48+24+36, width: UIScreen.main.bounds.size.width-80, height: 24))
    var conformationPageTextFieldUnderline = UIView(frame: CGRect(x: 0, y: 27+32+34+48+24+36+24+18, width: UIScreen.main.bounds.size.width, height: 2))
    var conformationPageTextFieldOverLine = UIView(frame: CGRect(x: 0, y: 27+32+34+48+24+36-18, width: UIScreen.main.bounds.size.width, height: 2))
     var conformationPageTextFieldIncorrectCodeLabel = UILabel(frame: CGRect(x: (UIScreen.main.bounds.size.width-300)/2.0, y: 80, width: 300, height: 100))
    var conformationPageNextButton = UIButton(frame: CGRect(x: (UIScreen.main.bounds.size.width-282)/2.0, y: 27+32+34+48+24+36+24+18+39, width: 282, height: 40))
    var conformationPageBackButton = UIButton(frame: CGRect(x: (UIScreen.main.bounds.size.width-300)/2.0, y: UIScreen.main.bounds.size.height-50-24-16, width: 300, height: 24))
   
    
    //profile name
    var profilePage = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50))
    
    var profilePageLabel = UILabel(frame: CGRect(x: (UIScreen.main.bounds.size.width-300)/2.0, y: 27, width: 300, height: 32))
    
    //----preferred username
    var profilePreferedUserNameTextField = UITextField(frame: CGRect(x: 14, y: 27+32+34, width: UIScreen.main.bounds.size.width-14-14-30-14, height: 24))
    
    var profilePreferedUserNameTextFieldUnderline = UIView(frame: CGRect(x: 0, y: 27+32+34+44, width: UIScreen.main.bounds.size.width, height: 1))
    
    var profilePreferedUserNameIcon = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width-14-30, y: 29-3, width: 30, height: 30))
   
    
    //----Username
    var profileUserNameTextField = UITextField(frame: CGRect(x: 14, y: 27+32+34+44+14, width: UIScreen.main.bounds.size.width-14-14-30-14, height: 24))
    
    var profileUserNameTextFieldUnderline =  UIView(frame: CGRect(x: 0, y: 27+32+34+44+14+44, width: UIScreen.main.bounds.size.width, height: 1))
    
    var profileUserNameIcon = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width-14-30, y: 29+44+14-3, width: 30, height: 30))
    
    //---additionals
    var profilePageAlreadyTakenUsernameLabel = UILabel(frame: CGRect(x: (UIScreen.main.bounds.size.width-300)/2.0, y: 80, width: 300, height: 100))
    
    var profilePageNextButton = UIButton(frame: CGRect(x: (UIScreen.main.bounds.size.width-282)/2.0, y:27+32+34+44+14+44+20+40, width: 282, height: 40))
    
    
    var profilePageBottomButton = UIButton(frame: CGRect(x: (UIScreen.main.bounds.size.width-300)/2.0, y: UIScreen.main.bounds.size.height-50-24-16, width: 300, height: 24))
   
    
    //password
    var passwordPage = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50))
    
    var passwordPageLabel = UILabel(frame: CGRect(x: (UIScreen.main.bounds.size.width-300)/2.0, y: 27, width: 300, height: 32))
    
    //----preferred username
    var passwordTextField1 =  UITextField(frame: CGRect(x: 14, y: 27+32+34, width: UIScreen.main.bounds.size.width-14-14-30-14, height: 24))
    
    var passwordTextField1Underline = UIView(frame: CGRect(x: 0, y: 27+32+34+44, width: UIScreen.main.bounds.size.width, height: 1))
    
    var password1Icon = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width-14-30, y: 29-3, width: 30, height: 30))
    
    
    //----Username
    var passwordTextField2 = UITextField(frame: CGRect(x: 14, y: 27+32+34+44+14, width: UIScreen.main.bounds.size.width-14-14-30-14, height: 24))
    
    var passwordTextField2Underline = UIView(frame: CGRect(x: 0, y: 27+32+34+44+14+44, width: UIScreen.main.bounds.size.width, height: 1))
    
    var password2Icon = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width-14-30, y: 27+32+34+44+14-3, width: 30, height: 30))
    
    //---additionals
    var passwordPageNotMatchingLabel = UILabel(frame: CGRect(x: (UIScreen.main.bounds.size.width-300)/2.0, y: 80, width: 300, height: 100))
    
    var passwordPageNextButton = UIButton(frame: CGRect(x: (UIScreen.main.bounds.size.width-282)/2.0, y:27+32+34+44+14+44+20+60, width: 282, height: 40))
    
    var passwordPageBottomButton = UIButton(frame: CGRect(x: (UIScreen.main.bounds.size.width-300)/2.0, y: UIScreen.main.bounds.size.height-50-24-16, width: 300, height: 24))
    
    
    public enum ExceptionString: String {
        /// Thrown during sign-up when email is already taken.
        case aliasExistsException = "AliasExistsException"
        /// Thrown when a user is not authorized to access the requested resource.
        case notAuthorizedException = "NotAuthorizedException"
        /// Thrown when the requested resource (for example, a dataset or record) does not exist.
        case resourceNotFoundException = "ResourceNotFoundException"
        /// Thrown when a user tries to use a login which is already linked to another account.
        case resourceConflictException = "ResourceConflictException"
        /// Thrown for missing or bad input parameter(s).
        case invalidParameterException = "InvalidParameterException"
        /// Thrown during sign-up when username is taken.
        case usernameExistsException = "UsernameExistsException"
        /// Thrown when user has not confirmed his email address.
        case userNotConfirmedException = "UserNotConfirmedException"
        /// Thrown when specified user does not exist.
        case userNotFoundException = "UserNotFoundException"
    }
    
  

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=theCoolGreenColor
        createHomeScreenLabel()
        creatLoginAndSignUpHomeScreenPage()
        createThePhoneNumberInput()
        createNumberConformation()
        createProfileName()
        createPasswords()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appSyncClient = appDelegate.appSyncClient
        // Do any additional setup after loading the view, typically from a nib.
    }
    func checkUserName(_ userName: String)
    {
        let serviceConfiguration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: nil)
        let userPoolConfiguration = AWSCognitoIdentityUserPoolConfiguration(clientId: "", clientSecret: "", poolId: "")
        AWSCognitoIdentityUserPool.register(with: serviceConfiguration, userPoolConfiguration: userPoolConfiguration, forKey: "UserPool")
        let pool = AWSCognitoIdentityUserPool(forKey: "UserPool")
        /*
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YOUR_IDENTITY_POOL_ID", identityProviderManager:pool)
 */
        let proposedUser = pool.getUser(userName)
          UIApplication.shared.isNetworkActivityIndicatorVisible = true
        proposedUser.getSession(userName, password: "12deadbeef", validationData: nil).continueWith(executor: AWSExecutor.mainThread(), block: { (awsTask) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if let error = awsTask.error as NSError? {
                // Error implies login failed. Check reason for failure
                let exceptionString = error.userInfo["__type"] as! String
                if let exception = ExceptionString(rawValue: exceptionString)
                {
                    switch exception
                    {
                    case .notAuthorizedException, .resourceConflictException:
                        
                        //return 2;
                        NSLog("The user does not exist 2")
                        // Account with this username does exist.
                       
                    default:
                        //return 1;
                     
                        // Some other exception (e.g., UserNotFoundException). Allow user to proceed.
                        NSLog("The user does not exist 1")
                        self.passwordPage.frame=CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
                        self.view.bringSubview(toFront:  self.passwordPage)
                        UIView.animate(withDuration: 0.15, animations: {
                            
                            
                            
                            self.passwordPage.frame=CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
                            //gets smaller
                            
                        }, completion: {(finished: Bool) in
                            // Completion
                            //self.loginAndSignUpInformationView.sendSubview(toBack: self.loginAndSignUpInformationViewSignUpView)
                            
                        })
                        
                    }
                } else {
                    // Some error we did not recognize. Optimistically allow user to proceed.
                   //return 3;
                    NSLog("The user does not exist optomoistic 3")
                    self.passwordPage.frame=CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
                    self.view.bringSubview(toFront:  self.passwordPage)
                    UIView.animate(withDuration: 0.15, animations: {
                        
                        
                        
                        self.passwordPage.frame=CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
                        //gets smaller
                        
                    }, completion: {(finished: Bool) in
                        // Completion
                        //self.loginAndSignUpInformationView.sendSubview(toBack: self.loginAndSignUpInformationViewSignUpView)
                        
                    })
                    
                    
                    
                }
            } else {
                // No error implies login worked (edge case where proposed username
                // is linked with an account which has password '1').
                //return 4;
                NSLog("User Exist 4")
                
                
            }
            return ""
            })
        
    }
    /// Check whether an email address is available.
    ///
    /// - Parameters:
    ///   - email: Check whether this email is available.
    ///   - completion: Called on completion with parameter true if email is available, and false otherwise.
        /*
    func checkEmail(_ email: String, completion: @escaping (Bool) -> Void) {
        let proposedUser = CognitoIdentityUserPoolManager.shared.pool.getUser(email)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        proposedUser.getSession(email, password: "deadbeef", validationData: nil).continueWith(executor: AWSExecutor.mainThread(), block: { (awsTask) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if let error = awsTask.error as? NSError {
                // Error implies login failed. Check reason for failure
                let exceptionString = error.userInfo["__type"] as! String
                if let exception = AWSConstants.ExceptionString(rawValue: exceptionString) {
                    switch exception {
                    case .notAuthorizedException, .resourceConflictException:
                        // Account with this email does exist.
                        completion(false)
                    default:
                        // Some other exception (e.g., UserNotFoundException). Allow user to proceed.
                        completion(true)
                    }
                } else {
                    // Some error we did not recognize. Optimistically allow user to proceed.
                    completion(true)
                }
            } else {
                // No error implies login worked (edge case where proposed email
                // is linked with an account which has password 'deadbeef').
                completion(false)
            }
            return nil
        })
    }
 */
    func createHomeScreenLabel()
    {
        let width1 = bounds1.size.width
        let height1 = bounds1.size.height
        let label = UILabel(frame:  CGRect(x: (width1-300)/2.0, y: 226, width: 300, height: 100))
        let customFont = UIFont(name: "Comfortaa_Regular", size: 88.0)
        
        label.textColor = .white
        label.text = "strimi"
        label.font=customFont
        label.font = label.font.withSize(44)
        label.textAlignment = .center
        view.addSubview(label)
        
        label.layer.shadowColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(0.66)).cgColor
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 0, height: 3)
        label.layer.masksToBounds = false
        
        let logo2ImageView = UIImageView(frame: CGRect(x: (width1-141)/2.0, y: 153, width: 141, height: 68))
        logo2ImageView.image=UIImage(named: "logo2")
        logo2ImageView.backgroundColor=UIColor.clear
        view.addSubview(logo2ImageView)
    }
    
    @objc func loginAndSignUpInformationViewSignUpButtonbuttonAction()
    {
        if(self.loginAndSignUpInformationViewSignUpView.alpha==1.0)
        {
            return
        }
        self.loginAndSignUpInformationViewLoginViewPasswordTextField.resignFirstResponder()
        self.loginAndSignUpInformationViewLoginViewUserNameTextField.resignFirstResponder()
         //cross disolve with .15 seconds
        self.loginAndSignUpInformationViewSignUpView.alpha=0.0
         self.loginAndSignUpInformationView.bringSubview(toFront: self.loginAndSignUpInformationViewSignUpView)
        self.loginAndSignUpInformationViewLoginView.alpha=1.0
        UIView.animate(withDuration: 0.15, animations: {
            //gets smaller
            self.loginAndSignUpInformationView.frame=CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
            self.loginAndSignUpInformationViewSignUpView.alpha=1.0
            self.loginAndSignUpInformationViewLoginView.alpha=0.0
            self.loginAndSignUpInformationViewLoginButton.setTitleColor(UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0)), for: .normal)
            self.loginAndSignUpInformationViewSignUpButton.setTitleColor(UIColor(red: CGFloat(74.0/255.0), green: CGFloat(74.0/255.0), blue: CGFloat(74.0/255.0), alpha: CGFloat(1.0)), for: .normal)
        }, completion: {(finished: Bool) in
            // Completion
           
            
        })
    }
    @objc func loginAndSignUpInformationViewLoginButtonbuttonAction()
    {
        if(self.loginAndSignUpInformationViewLoginView.alpha==1.0)
        {
            return
        }
        //cross disolve with .15 seconds
        self.loginAndSignUpInformationViewSignUpView.alpha=1.0
        self.loginAndSignUpInformationViewLoginView.alpha=0.0
        
        UIView.animate(withDuration: 0.15, animations: {
            //gets smaller
             self.loginAndSignUpInformationView.frame=CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
            self.loginAndSignUpInformationViewSignUpView.alpha=0.0
            self.loginAndSignUpInformationViewLoginView.alpha=1.0
            self.loginAndSignUpInformationViewSignUpButton.setTitleColor(UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0)), for: .normal)
            self.loginAndSignUpInformationViewLoginButton.setTitleColor(UIColor(red: CGFloat(74.0/255.0), green: CGFloat(74.0/255.0), blue: CGFloat(74.0/255.0), alpha: CGFloat(1.0)), for: .normal)
            
        }, completion: {(finished: Bool) in
            // Completion
            self.loginAndSignUpInformationView.sendSubview(toBack: self.loginAndSignUpInformationViewSignUpView)
            
        })
    }
    @objc func loginAndSignUpInformationViewLoginViewLoginButtonbuttonAction()
    {
        AWSMobileClient.sharedInstance().signIn(username: self.loginAndSignUpInformationViewLoginViewUserNameTextField.text ?? "", password: self.loginAndSignUpInformationViewLoginViewPasswordTextField.text ?? "") { (signInResult, error) in
            if let error = error  {
                print("\(error.localizedDescription)")
            } else if let signInResult = signInResult {
                switch (signInResult.signInState) {
                case .signedIn:
                    print("User is signed in.")
                     self.performSegue(withIdentifier: "loginToHome", sender: nil)
                case .smsMFA:
                    print("SMS message sent to \(signInResult.codeDetails!.destination!)")
                default:
                    print("Sign In needs info which is not et supported.")
                }
            }
        }
    }
    @objc func loginAndSignUpInformationViewSignUpViewPhonebuttonAction()
    {
        self.profilePage.frame=CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
        self.view.bringSubview(toFront: self.profilePage)
        UIView.animate(withDuration: 0.15, animations: {
            
            
            
            self.profilePage.frame=CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
            //gets smaller
            
        }, completion: {(finished: Bool) in
            // Completion
            //self.loginAndSignUpInformationView.sendSubview(toBack: self.loginAndSignUpInformationViewSignUpView)
            
        })
        
    }
    @objc func conformationPageNextButtonAction()
    {
        self.profilePage.frame=CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
         self.view.bringSubview(toFront: self.profilePage)
        UIView.animate(withDuration: 0.15, animations: {
            
            
            
            self.profilePage.frame=CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
            //gets smaller
            
        }, completion: {(finished: Bool) in
            // Completion
            //self.loginAndSignUpInformationView.sendSubview(toBack: self.loginAndSignUpInformationViewSignUpView)
           
        })
    }
    
    @objc func conformationPageBackButtonAction()
    {
       
         self.conformationPage.frame=CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
        
        UIView.animate(withDuration: 0.15, animations: {
            
            
            
            self.conformationPage.frame=CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
            //gets smaller
            
        }, completion: {(finished: Bool) in
            // Completion
            //self.loginAndSignUpInformationView.sendSubview(toBack: self.loginAndSignUpInformationViewSignUpView)
            self.view.sendSubview(toBack: self.conformationPage)
        })
    }
    
    @objc func passwordPageBottomButtonAction()
    {
        self.passwordPage.frame=CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
        
        UIView.animate(withDuration: 0.15, animations: {
            
            
            
            self.passwordPage.frame=CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
            //gets smaller
            
        }, completion: {(finished: Bool) in
            // Completion
            //self.loginAndSignUpInformationView.sendSubview(toBack: self.loginAndSignUpInformationViewSignUpView)
            self.view.sendSubview(toBack: self.passwordPage)
        })
    }
    
    
    
    
    @objc func profilePageNextButtonAction()
    {
        checkUserName(profileUserNameTextField.text ?? "")
       
    }
    
    @objc func profilePageBottomButtonAction()
    {
         self.profilePage.frame=CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
        
        UIView.animate(withDuration: 0.15, animations: {
            
            self.profilePage.frame=CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
            
           
            //gets smaller
            
        }, completion: {(finished: Bool) in
            // Completion
            //self.loginAndSignUpInformationView.sendSubview(toBack: self.loginAndSignUpInformationViewSignUpView)
            self.view.sendSubview(toBack: self.profilePage)
        })
    }
    
    @objc func passwordPageNextButtonAction()
    {
        self.phoneView.frame=CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
        self.view.bringSubview(toFront: self.phoneView)
        UIView.animate(withDuration: 0.15, animations: {
            //gets smaller
            self.phoneView.frame=CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
        }, completion: {(finished: Bool) in
            // Completion
            //self.loginAndSignUpInformationView.sendSubview(toBack: self.loginAndSignUpInformationViewSignUpView)
            
        })
    }
    
    
    @objc func phoneViewPhoneNumberNextButtonbuttonAction()
    {
       self.conformationPage.frame=CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
        self.view.bringSubview(toFront: self.conformationPage)
        UIView.animate(withDuration: 0.15, animations: {
            
            
            
             self.conformationPage.frame=CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
            //gets smaller
            
        }, completion: {(finished: Bool) in
            // Completion
            //self.loginAndSignUpInformationView.sendSubview(toBack: self.loginAndSignUpInformationViewSignUpView)
            
        })
    }




    @objc func phoneViewLoginButtonAction()
    {
         self.phoneView.frame=CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
        
        UIView.animate(withDuration: 0.15, animations: {
            
            self.phoneView.frame=CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
            //gets smaller
           
        }, completion: {(finished: Bool) in
            // Completion
            //self.loginAndSignUpInformationView.sendSubview(toBack: self.loginAndSignUpInformationViewSignUpView)
            self.view.sendSubview(toBack: self.phoneView)
        })
        
    }
    @IBAction func textFieldEditingDidChange(_ sender: Any)
    {
    
        
        UIView.animate(withDuration: 0.15, animations: {
            //gets smaller
            self.loginAndSignUpInformationView.frame=CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
        }, completion: {(finished: Bool) in
            // Completion
            
            
        })
        
    }
    @IBAction func textFieldEditingDidChangePhoneNumber(_ sender: Any)
    {
        
        
        UIView.animate(withDuration: 0.15, animations: {
            //gets smaller
            self.loginAndSignUpInformationView.frame=CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-50)
        }, completion: {(finished: Bool) in
            // Completion
            
            
        })
        
    }
    func creatLoginAndSignUpHomeScreenPage()
    {
        loginAndSignUpInformationView.backgroundColor=UIColor.white
        loginAndSignUpInformationView.layer.cornerRadius=12
        view.addSubview(loginAndSignUpInformationView)
        
         loginAndSignUpInformationViewSignUpButton.setTitle("sign up",for: .normal)
        loginAndSignUpInformationViewSignUpButton.addTarget(self, action: #selector(loginAndSignUpInformationViewSignUpButtonbuttonAction), for: .touchUpInside)

        loginAndSignUpInformationViewSignUpButton.titleLabel?.font =  UIFont(name: "Comfortaa_Regular", size: 88.0)
        
        
        loginAndSignUpInformationViewSignUpButton.titleLabel?.font =  loginAndSignUpInformationViewSignUpButton.titleLabel?.font.withSize(32)
       
        
        loginAndSignUpInformationViewSignUpButton.setTitleColor(UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0)), for: .normal)
        
        loginAndSignUpInformationView.addSubview(loginAndSignUpInformationViewSignUpButton)
        loginAndSignUpInformationViewLoginButton.setTitle("login",for: .normal)
        loginAndSignUpInformationViewLoginButton.addTarget(self, action: #selector(loginAndSignUpInformationViewLoginButtonbuttonAction), for: .touchUpInside)
        loginAndSignUpInformationViewLoginButton.titleLabel?.font =  UIFont(name: "Comfortaa_Regular", size: 88.0)
        
        
        loginAndSignUpInformationViewLoginButton.titleLabel?.font =  loginAndSignUpInformationViewLoginButton.titleLabel?.font.withSize(32)
       
        
        loginAndSignUpInformationViewLoginButton.setTitleColor(UIColor(red: CGFloat(74.0/255.0), green: CGFloat(74.0/255.0), blue: CGFloat(74.0/255.0), alpha: CGFloat(1.0)), for: .normal)
        
        loginAndSignUpInformationView.addSubview(loginAndSignUpInformationViewLoginButton)
        
        //
        
        loginAndSignUpInformationViewLoginViewUserNameTextField.attributedPlaceholder = NSAttributedString(string: "username",
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))])
        loginAndSignUpInformationViewLoginViewUserNameTextField.backgroundColor=UIColor .clear
        loginAndSignUpInformationViewLoginViewUserNameTextField.textColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        loginAndSignUpInformationViewLoginViewUserNameTextField.font = UIFont(name: "Comfortaa_Regular", size: 20)
        loginAndSignUpInformationViewLoginViewUserNameTextField.font =  loginAndSignUpInformationViewLoginViewUserNameTextField.font?.withSize(18)
        
        loginAndSignUpInformationViewLoginViewUserNameTextField.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: UIControlEvents.editingChanged)
        
        
        
        
        loginAndSignUpInformationViewLoginViewPasswordTextField.attributedPlaceholder = NSAttributedString(string: "password",
                                                                                                           attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))])
        loginAndSignUpInformationViewLoginViewPasswordTextField.backgroundColor=UIColor .clear
        
        
        loginAndSignUpInformationViewLoginViewPasswordTextField.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: UIControlEvents.editingChanged)
        
        
       loginAndSignUpInformationViewLoginViewPasswordTextField.textColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        loginAndSignUpInformationViewLoginViewPasswordTextField.font = UIFont(name: "Comfortaa_Regular", size: 20)
         loginAndSignUpInformationViewLoginViewPasswordTextField.font =  loginAndSignUpInformationViewLoginViewPasswordTextField.font?.withSize(18)
        loginAndSignUpInformationViewLoginViewUserNameTextFieldUnderline.backgroundColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        loginAndSignUpInformationViewLoginViewPasswordTextFieldUnderline.backgroundColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        
        loginAndSignUpInformationViewLoginViewUserNameIcon.image=UIImage(named: "profileIcon")
        
         loginAndSignUpInformationViewLoginViewPasswordIcon.image=UIImage(named: "lock")
        
        loginAndSignUpInformationViewLoginViewForgotButton.setTitle("forgot?",for: .normal)
        
        loginAndSignUpInformationViewLoginViewForgotButton.setTitleColor(UIColor(red: CGFloat(0.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(0.0/255.0), alpha: CGFloat(1.0)), for: .normal)
        loginAndSignUpInformationViewLoginViewForgotButton.titleLabel?.font =  UIFont(name: "Comfortaa_Regular", size: 88.0)
        
        
        loginAndSignUpInformationViewLoginViewForgotButton.titleLabel?.font =  loginAndSignUpInformationViewLoginViewForgotButton.titleLabel?.font.withSize(14)
        
        loginAndSignUpInformationViewLoginViewLoginButton.setTitle("",for: .normal)
        loginAndSignUpInformationViewLoginViewLoginButton.addTarget(self, action: #selector(loginAndSignUpInformationViewLoginViewLoginButtonbuttonAction), for: .touchUpInside)
        loginAndSignUpInformationViewLoginViewLoginButton.setBackgroundImage(UIImage(named: "loginButton"), for: .normal)
        
        loginAndSignUpInformationViewLoginView.addSubview(loginAndSignUpInformationViewLoginViewUserNameTextField)
        loginAndSignUpInformationViewLoginView.addSubview(loginAndSignUpInformationViewLoginViewUserNameTextFieldUnderline)
        loginAndSignUpInformationViewLoginView.addSubview(loginAndSignUpInformationViewLoginViewUserNameIcon)
        
        loginAndSignUpInformationViewLoginView.addSubview(loginAndSignUpInformationViewLoginViewPasswordTextField )
        loginAndSignUpInformationViewLoginView.addSubview(loginAndSignUpInformationViewLoginViewPasswordTextFieldUnderline)
        loginAndSignUpInformationViewLoginView.addSubview(loginAndSignUpInformationViewLoginViewPasswordIcon)
        loginAndSignUpInformationViewLoginView.addSubview(loginAndSignUpInformationViewLoginViewForgotButton)
        loginAndSignUpInformationViewLoginView.addSubview(loginAndSignUpInformationViewLoginViewLoginButton)
        
        loginAndSignUpInformationView.addSubview(loginAndSignUpInformationViewLoginView)
        
        
        loginAndSignUpInformationViewSignUpViewInstagram.setTitle("",for: .normal)
        loginAndSignUpInformationViewSignUpViewInstagram.setBackgroundImage(UIImage(named: "instagramButton"), for: .normal)
        loginAndSignUpInformationViewSignUpViewSeperator.backgroundColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        
        
        loginAndSignUpInformationViewSignUpViewPhone.addTarget(self, action: #selector(loginAndSignUpInformationViewSignUpViewPhonebuttonAction), for: .touchUpInside)
        
        
        
        loginAndSignUpInformationViewSignUpViewPhone.setTitle("Sign up with phone",for: .normal)
        loginAndSignUpInformationViewSignUpViewPhone.titleLabel?.font =  UIFont(name: "Comfortaa_Regular", size: 88.0)
        
        
        loginAndSignUpInformationViewSignUpViewPhone.titleLabel?.font =  loginAndSignUpInformationViewSignUpViewPhone.titleLabel?.font.withSize(20)
         loginAndSignUpInformationViewSignUpViewPhone.setTitleColor(theCoolGreenColor, for: .normal)
        
        
        
        
        
        
       loginAndSignUpInformationViewSignUpView.addSubview(loginAndSignUpInformationViewSignUpViewInstagram)
        loginAndSignUpInformationViewSignUpView.addSubview(loginAndSignUpInformationViewSignUpViewSeperator)
        loginAndSignUpInformationViewSignUpView.addSubview(loginAndSignUpInformationViewSignUpViewPhone)
        
        loginAndSignUpInformationView.addSubview(loginAndSignUpInformationViewSignUpView)
        
        
        loginAndSignUpInformationView.sendSubview(toBack: loginAndSignUpInformationViewSignUpView)
        loginAndSignUpInformationViewSignUpView.alpha=0.0
        
    }
    
    func createThePhoneNumberInput()
    {
        self.phoneView.backgroundColor=UIColor.white
        self.phoneView.layer.cornerRadius=12
        view.addSubview(self.phoneView)
        
        phoneViewLabel.textColor=UIColor(red: CGFloat(74.0/255.0), green: CGFloat(74.0/255.0), blue: CGFloat(74.0/255.0), alpha: CGFloat(1.0))
        phoneViewLabel.text="phone"
        phoneViewLabel.font =  UIFont(name: "Comfortaa_Regular", size: 88.0)
        
        
        phoneViewLabel.font =  phoneViewLabel.font.withSize(20)
        
        phoneViewCountryCodeLabel.textColor=theCoolGreenColor
        phoneViewCountryCodeLabel.text="us +1"
        phoneViewCountryCodeLabel.font =  UIFont(name: "Comfortaa_Regular", size: 88.0)
        phoneViewCountryCodeLabel.font =  phoneViewLabel.font.withSize(18)
        phoneViewCountryCodeLabelVerticalSeperator.backgroundColor=UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        
        phoneViewCountryCodeLabelHorizontalSeperator.backgroundColor=UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        
        phoneViewPhoneNumberTextField.attributedPlaceholder = NSAttributedString(string: "number",
                                                                                                           attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))])
        phoneViewPhoneNumberTextField.backgroundColor=UIColor .clear
        
        
        phoneViewPhoneNumberTextField.addTarget(self, action: #selector(textFieldEditingDidChangePhoneNumber(_:)), for: UIControlEvents.editingChanged)
        phoneViewPhoneNumberTextField.keyboardType=UIKeyboardType.numberPad
        
        phoneViewPhoneNumberTextField.textColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        phoneViewPhoneNumberTextField.font = UIFont(name: "Comfortaa_Regular", size: 20)
        phoneViewPhoneNumberTextField.font =  phoneViewPhoneNumberTextField.font?.withSize(18)
        
        phoneViewPhoneNumberNextButton.setTitle("",for: .normal)
        phoneViewPhoneNumberNextButton.addTarget(self, action: #selector(phoneViewPhoneNumberNextButtonbuttonAction), for: .touchUpInside)
        phoneViewPhoneNumberNextButton.setBackgroundImage(UIImage(named: "nextNotReadyButton"), for: .normal)
        
        
        phoneViewHaveAnAcountLabel.textColor=UIColor(red: CGFloat(74.0/255.0), green: CGFloat(74.0/255.0), blue: CGFloat(74.0/255.0), alpha: CGFloat(1.0))
        phoneViewHaveAnAcountLabel.text="have an account?"
        phoneViewHaveAnAcountLabel.font =  UIFont(name: "Comfortaa_Regular", size: 88.0)
        
        
        phoneViewHaveAnAcountLabel.font =  phoneViewHaveAnAcountLabel.font.withSize(18)
        
        phoneViewLoginButton.setTitle("login.",for: .normal)
        
        phoneViewLoginButton.setTitleColor(theCoolGreenColor, for: .normal)
        phoneViewLoginButton.titleLabel?.font =  UIFont(name: "Comfortaa_Regular", size: 88.0)
        
        
        phoneViewLoginButton.titleLabel?.font =  phoneViewLoginButton.titleLabel?.font.withSize(18)
        
         phoneViewLoginButton.addTarget(self, action: #selector(phoneViewLoginButtonAction), for: .touchUpInside)
        
        self.phoneView.addSubview(phoneViewLabel)
        self.phoneView.addSubview(phoneViewCountryCodeLabel)
        self.phoneView.addSubview(phoneViewCountryCodeLabelVerticalSeperator)
        self.phoneView.addSubview(phoneViewPhoneNumberTextField)
        self.phoneView.addSubview(phoneViewCountryCodeLabelHorizontalSeperator)
        
        self.phoneView.addSubview(phoneViewPhoneNumberNextButton)
        
         self.phoneView.addSubview(phoneViewHaveAnAcountLabel)
        
         self.phoneView.addSubview(phoneViewLoginButton)
        
        
        
        //https://www.instagram.com/developer/
        
    }
    
    func createNumberConformation()
    {
        
        conformationPageLabel.textColor=UIColor(red: CGFloat(74.0/255.0), green: CGFloat(74.0/255.0), blue: CGFloat(74.0/255.0), alpha: CGFloat(1.0))
        conformationPageLabel.text="enter conformation code"
        conformationPageLabel.font =  UIFont(name: "Comfortaa_Regular", size: 88.0)
        
        conformationPageLabel.font =  conformationPageLabel.font.withSize(20)
        
        conformationPageLabelDescription.textColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        conformationPageLabelDescription.text="enter 6 digit conformation code\nsent to 123456789"
        conformationPageLabelDescription.font =  UIFont(name: "Comfortaa_Regular", size: 88.0)
        
        
        conformationPageLabelDescription.font =  conformationPageLabelDescription.font.withSize(18)
        
        conformationPageRequestNewOneButton.setTitle("request new one.",for: .normal)
        
        conformationPageRequestNewOneButton.setTitleColor(theCoolGreenColor, for: .normal)
        conformationPageRequestNewOneButton.titleLabel?.font =  UIFont(name: "Comfortaa_Regular", size: 88.0)
        
        
        conformationPageRequestNewOneButton.titleLabel?.font =  conformationPageRequestNewOneButton.titleLabel?.font.withSize(18)
        
       // conformationPageRequestNewOneButton.addTarget(self, action: #selector(conformationPageRequestNewOneButtonAction), for: .touchUpInside)
        
        //this is where you should introduce in app notifications or action ui recongizers
        
        conformationPageTextField.attributedPlaceholder = NSAttributedString(string: "confirmation code",
                                                                                 attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))])
        conformationPageTextField.backgroundColor=UIColor .clear
        
        
        conformationPageTextField.addTarget(self, action: #selector(textFieldEditingDidChangePhoneNumber(_:)), for: UIControlEvents.editingChanged)
        conformationPageTextField.keyboardType=UIKeyboardType.numberPad
        
        conformationPageTextField.textColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        conformationPageTextField.font = UIFont(name: "Comfortaa_Regular", size: 20)
        conformationPageTextField.font =  conformationPageTextField.font?.withSize(18)
        
        conformationPageTextFieldUnderline.backgroundColor=UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        
        
        conformationPageNextButton.setTitle("",for: .normal)
        conformationPageNextButton.addTarget(self, action: #selector(conformationPageNextButtonAction), for: .touchUpInside)
        conformationPageNextButton.setBackgroundImage(UIImage(named: "nextNotReadyButton"), for: .normal)
        
        conformationPageBackButton.setTitle("back",for: .normal)
        
        conformationPageBackButton.setTitleColor(theCoolGreenColor, for: .normal)
        conformationPageBackButton.titleLabel?.font =  UIFont(name: "Comfortaa_Regular", size: 88.0)
        
        
        conformationPageBackButton.titleLabel?.font =  conformationPageBackButton.titleLabel?.font.withSize(14)
        
        conformationPageBackButton.addTarget(self, action: #selector(conformationPageBackButtonAction), for: .touchUpInside)
        
        conformationPage.addSubview(conformationPageLabel)
        conformationPage.addSubview(conformationPageLabelDescription)
        conformationPage.addSubview(conformationPageRequestNewOneButton)
        conformationPage.addSubview(conformationPageTextField)
        conformationPage.addSubview(conformationPageTextFieldUnderline)
        conformationPage.addSubview(conformationPageTextFieldOverLine)
        conformationPage.addSubview(conformationPageTextFieldIncorrectCodeLabel)
        conformationPage.addSubview(conformationPageNextButton)
        conformationPage.addSubview(conformationPageBackButton)
        
        conformationPageTextFieldOverLine.isHidden=true
        
        conformationPage.addSubview(conformationPageTextFieldOverLine)
        conformationPage.backgroundColor=UIColor.white
        conformationPage.layer.cornerRadius=12
        view.addSubview(conformationPage)
        view.sendSubview(toBack: conformationPage)
    }
    
    func createProfileName()
    {
        
        profilePageLabel.textColor=UIColor(red: CGFloat(74.0/255.0), green: CGFloat(74.0/255.0), blue: CGFloat(74.0/255.0), alpha: CGFloat(1.0))
        profilePageLabel.text="profile"
        profilePageLabel.font =  UIFont(name: "Comfortaa_Regular", size: 88.0)
        
        profilePageLabel.font =  profilePageLabel.font.withSize(20)
        
        
        profilePreferedUserNameTextField.attributedPlaceholder = NSAttributedString(string: "what's your name?",
                                                                                                           attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))])
        profilePreferedUserNameTextField.backgroundColor=UIColor .clear
        profilePreferedUserNameTextField.textColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        profilePreferedUserNameTextField.font = UIFont(name: "Comfortaa_Regular", size: 20)
        profilePreferedUserNameTextField.font =  profilePreferedUserNameTextField.font?.withSize(18)
        
        profilePreferedUserNameTextField.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: UIControlEvents.editingChanged)
        
        
        
        
        profileUserNameTextField.attributedPlaceholder = NSAttributedString(string: "pick a fun username.",
                                                                                                           attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))])
        profileUserNameTextField.backgroundColor=UIColor .clear
        
        
        profileUserNameTextField.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: UIControlEvents.editingChanged)
        
        
        profileUserNameTextField.textColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        profileUserNameTextField.font = UIFont(name: "Comfortaa_Regular", size: 20)
       profileUserNameTextField.font =  loginAndSignUpInformationViewLoginViewPasswordTextField.font?.withSize(18)
        profileUserNameTextFieldUnderline.backgroundColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        profilePreferedUserNameTextFieldUnderline.backgroundColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        
        profilePreferedUserNameIcon.image=UIImage(named: "hiIcon")
        
        profileUserNameIcon.image=UIImage(named: "profileIcon")
        
        profilePageBottomButton.setTitle("back",for: .normal)
        
        profilePageBottomButton.setTitleColor(theCoolGreenColor, for: .normal)
        profilePageBottomButton.titleLabel?.font =  UIFont(name: "Comfortaa_Regular", size: 88.0)
        
        
        profilePageBottomButton.titleLabel?.font =  profilePageBottomButton.titleLabel?.font.withSize(14)
        
         profilePageBottomButton.addTarget(self, action: #selector(profilePageBottomButtonAction), for: .touchUpInside)
        
        
        profilePageNextButton.setTitle("",for: .normal)
        profilePageNextButton.addTarget(self, action: #selector(profilePageNextButtonAction), for: .touchUpInside)
        profilePageNextButton.setBackgroundImage(UIImage(named: "nextNotReadyButton"), for: .normal)
        
         profilePage.addSubview(profilePageLabel)
        profilePage.addSubview(profilePreferedUserNameTextField)
        profilePage.addSubview(profilePreferedUserNameTextFieldUnderline)
        profilePage.addSubview(profilePreferedUserNameIcon)
        profilePage.addSubview(profileUserNameTextField)
        profilePage.addSubview(profileUserNameTextFieldUnderline)
        profilePage.addSubview(profileUserNameIcon)
        profilePage.addSubview(profilePageNextButton)
        profilePage.addSubview(profilePageBottomButton)
        
        profilePage.backgroundColor=UIColor.white
        profilePage.layer.cornerRadius=12
        view.addSubview(profilePage)
        view.sendSubview(toBack: profilePage)
    }
    
    func createPasswords()
    {
        
        passwordPageLabel.textColor=UIColor(red: CGFloat(74.0/255.0), green: CGFloat(74.0/255.0), blue: CGFloat(74.0/255.0), alpha: CGFloat(1.0))
        passwordPageLabel.text="password"
        passwordPageLabel.font =  UIFont(name: "Comfortaa_Regular", size: 88.0)
        
        passwordPageLabel.font =  passwordPageLabel.font.withSize(20)
        
        
        
        passwordTextField1.attributedPlaceholder = NSAttributedString(string: "what's your name?",
                                                                                    attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))])
        passwordTextField1.backgroundColor=UIColor .clear
        passwordTextField1.textColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
       passwordTextField1.font = UIFont(name: "Comfortaa_Regular", size: 20)
        passwordTextField1.font =  passwordTextField1.font?.withSize(18)
        
        passwordTextField1.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: UIControlEvents.editingChanged)
        
        
        
        
       passwordTextField2.attributedPlaceholder = NSAttributedString(string: "pick a fun username.",
                                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))])
        passwordTextField2.backgroundColor=UIColor .clear
        
        
        passwordTextField2.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: UIControlEvents.editingChanged)
        
        
        passwordTextField2.textColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        passwordTextField2.font = UIFont(name: "Comfortaa_Regular", size: 20)
        passwordTextField2.font =  passwordTextField2.font?.withSize(18)
        passwordTextField1Underline.backgroundColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        passwordTextField2Underline.backgroundColor = UIColor(red: CGFloat(155.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        
       password1Icon.image=UIImage(named: "hiIcon")
        
        password2Icon.image=UIImage(named: "profileIcon")
        
        passwordPageBottomButton.setTitle("back",for: .normal)
        
        passwordPageBottomButton.setTitleColor(theCoolGreenColor, for: .normal)
        passwordPageBottomButton.titleLabel?.font =  UIFont(name: "Comfortaa_Regular", size: 88.0)
        
        
        passwordPageBottomButton.titleLabel?.font =  passwordPageBottomButton.titleLabel?.font.withSize(14)
       passwordPageBottomButton.addTarget(self, action: #selector(passwordPageBottomButtonAction), for: .touchUpInside)
        
        //passwordPageBottomButton
        
        passwordPageNextButton.setTitle("",for: .normal)
        passwordPageNextButton.addTarget(self, action: #selector(passwordPageNextButtonAction), for: .touchUpInside)
        passwordPageNextButton.setBackgroundImage(UIImage(named: "nextNotReadyButton"), for: .normal)
        
        passwordPage.addSubview(passwordPageLabel)
        passwordPage.addSubview(passwordTextField1)
        passwordPage.addSubview(passwordTextField1Underline)
        passwordPage.addSubview(password1Icon)
        passwordPage.addSubview(passwordTextField2)
        passwordPage.addSubview(passwordTextField2Underline)
        passwordPage.addSubview(password2Icon)
        
        passwordPage.addSubview(passwordPageNextButton)
        passwordPage.addSubview(passwordPageBottomButton)
       
        
        
        passwordPage.backgroundColor=UIColor.white
        passwordPage.layer.cornerRadius=12
        view.addSubview(passwordPage)
        view.sendSubview(toBack: passwordPage)
    }
    
    //You can now add data to your database with a mutation:
    /*
     NOTE:The AppSync API is asynchronous, which means that simply invoking runMutation and runQuery back-to-back may not work as expected, because the mutation will not complete before the query is sent. If you want to ensure that a mutation is complete before issuing a query, use the mutation’s callback to trigger the query, as in:
     */
    func runMutation(){
        let mutationInput = CreateTodoInput(name: "Use AppSync", description:"Realtime and Offline")
        appSyncClient?.perform(mutation: CreateTodoMutation(input: mutationInput)) { (result, error) in
            if let error = error as? AWSAppSyncClientError {
                print("Error occurred: \(error.localizedDescription )")
            }
            if let resultError = result?.errors {
                print("Error saving the item on server: \(resultError)")
                return
            }
        }
    }
    
    
    /*
     ///way to do function to counter the NOTE: left above. HANDLES DIFFERENT TIME SITUATIONS
     func runMutation(){
     let mutationInput = CreateTodoInput(name: "Use AppSync", description:"Realtime and Offline")
     appSyncClient?.perform(mutation: CreateTodoMutation(input: mutationInput)) { [weak self] (result, error) in
     // ... do whatever error checking or processing you wish here
     self?.runQuery()
     }
     }
     */
    
    
    //Next, query the data:
    func runQuery(){
        appSyncClient?.fetch(query: ListTodosQuery(), cachePolicy: .returnCacheDataAndFetch) {(result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            result?.data?.listTodos?.items!.forEach { print(($0?.name)! + " " + ($0?.description)!) }
        }
    }
    
    //You can also setup realtime subscriptions to data:
    func subscribe() {
        do {
            discard = try appSyncClient?.subscribe(subscription: OnCreateTodoSubscription(), resultHandler: { (result, transaction, error) in
                if let result = result {
                    print(result.data!.onCreateTodo!.name + " " + result.data!.onCreateTodo!.description!)
                } else if let error = error {
                    print(error.localizedDescription)
                }
            })
        } catch {
            print("Error starting subscription.")
        }
    }
}
