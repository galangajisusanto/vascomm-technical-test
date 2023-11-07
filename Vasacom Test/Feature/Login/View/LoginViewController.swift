//
//  LoginViewController.swift
//  Vasacom Test
//
//  Created by MEKARI on 02/10/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    let injection = Injection()
    var viewModel: LoginViewModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel = injection.provideLoginViewModel()
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        /// Validasi:
        guard let email = emailTextField.text, !email.isEmpty else {
            showAllert(title: "Validasi Error", subtitle: "Email Tidak Boleh Kosong")
            return
        }
        
        guard let password = passwordTextField.text else {
            showAllert(title: "Validasi Error", subtitle: "Password Tidak Boleh Kosong")
            return
        }
        
        login(email: email, password: password)
        
    }
    
    
    
    private func login(email: String, password: String) {
        startActivityIndicator()
        print(email, password)
        self.viewModel?.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self?.stopActivityIndicator()
                    self?.navigationController?.pushViewController(HomeViewController(), animated: true)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.stopActivityIndicator()
                    self?.showAllert(title: "Error", subtitle: error.localizedDescription)
                }
                
            }
        }
    }


}
