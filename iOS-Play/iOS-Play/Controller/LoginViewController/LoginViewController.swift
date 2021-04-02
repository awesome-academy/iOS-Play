//
//  LoginViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/1/21.
//

import Foundation
import UIKit
import SnapKit
import AuthenticationServices

class LoginViewController : UIViewController {
    
    private let backButton = UIButton(type: .custom).then {
        $0.backgroundColor = UIColor.systemPink
        $0.setImage(Asset.back.image, for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    private let iOSImage = UIImageView().then {
        $0.image = Asset.ios.image
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    private let PlayImage = UIImageView().then {
        $0.image = Asset.googlePlay.image
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    private let AppleButton = ASAuthorizationAppleIDButton().then {
        $0.addTarget(self, action: #selector(appleTapped), for: .touchUpInside)
    }
    
    private let facebookButton = UIButton(type: .custom).then {
        $0.backgroundColor = UIColor.systemBlue
        $0.setTitle("Sign in with FaceBook", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        
        $0.addTarget(self, action: #selector(facebookTapped), for: .touchUpInside)
    }
    
    private let emailButton = UIButton(type: .custom).then {
        $0.backgroundColor = UIColor.systemPink
        $0.setTitle("Sign in with Email", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        
        $0.addTarget(self, action: #selector(emailTapped), for: .touchUpInside)
    }
    
    private let googleButton = UIButton(type: .custom).then {
        $0.backgroundColor = UIColor.systemGreen
        $0.setTitle("Sign in with Google", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15,weight: .bold)
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        
        $0.addTarget(self, action: #selector(googleTapped), for: .touchUpInside)
    }
    
    lazy var buttonStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.spacing = 5
        $0.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        $0.addArrangedSubview(emailButton)
        $0.addArrangedSubview(facebookButton)
        $0.addArrangedSubview(googleButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
    }
    
    func configViews() {
        view.backgroundColor = .white
        
        view.addSubview(backButton)
        view.addSubview(buttonStackView)
        view.addSubview(iOSImage)
        view.addSubview(PlayImage)
        view.addSubview(AppleButton)
        
        backButton.do {
            
            $0.snp.makeConstraints { (make) in
                make.top.equalToSuperview().inset(60)
                make.left.equalToSuperview().inset(20)
                make.width.height.equalTo(30)
            }
            
            $0.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        }
        
        buttonStackView.do {
            $0.snp.makeConstraints { (make) in
                make.bottom.equalToSuperview().inset(250)
                make.left.right.equalToSuperview().inset(40)
                make.height.equalTo(160)
            }
        }
        
        iOSImage.do {
            $0.snp.makeConstraints { (make) in
                make.bottom.equalTo(PlayImage.snp.top).offset(20)
                make.left.right.equalToSuperview().inset(30)
                make.height.equalTo(40)
            }
        }
        
        PlayImage.do {
            $0.snp.makeConstraints { (make) in
                make.bottom.equalTo(buttonStackView.snp.top).offset(-50)
                make.left.right.equalToSuperview().inset(30)
                make.height.equalTo(250)
            }
        }
        
        AppleButton.do {
            $0.snp.makeConstraints { (make) in
                make.top.equalTo(buttonStackView.snp.bottom).offset(70)
                make.left.right.equalToSuperview().inset(40)
                make.height.equalTo(160 / 3 - 5 )
            }
        }
    }
    
    @objc func backTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func googleTapped() {

    }
    
    @objc func facebookTapped() {
        
    }
    
    @objc func emailTapped() {
        
    }
    
    @objc func appleTapped() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName,.email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
}


extension  LoginViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {

    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential:
            
//get fullname and email
//            let firstname = credentials.fullName?.givenName
//            let lastname  = credentials.fullName?.familyName
//            let email = credentials.email
          
            break
        default :
            break
        }
    }
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
}
