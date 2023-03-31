//
//  RegisterViewUI.swift
//  ExameniOS
//
//  Created by Luis Fernando Sánchez Palma on 30/03/23.
//

import UIKit

protocol RegisterViewUIDelegate {
    func nofifyFailureContinue(message: String)
    func notifyContinue()
}

class RegisterViewUI: UIView {
    var delegate: RegisterViewUIDelegate?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView (frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.clipsToBounds = false
        return scrollView
    }()
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var headerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleHeader: UILabel = {
       let label = UILabel()
        label.text = "Registrate"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var topLine: UIView = {
       let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3474234272)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var toolBar: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100.0, height: 44.0))
        let botonAceptar = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(finishEditing))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        botonAceptar.tag = 0
        toolbar.setItems([spacer,botonAceptar], animated: true)
        return toolbar
    }()
    
    lazy var nameTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Nombre"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameTextfield: UITextField = {
       let textfield = UITextField()
        textfield.backgroundColor = .white
        textfield.textColor = .black
        textfield.placeholder = "Nombre"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textfield.leftViewMode = .always
        textfield.inputAccessoryView = toolBar
        textfield.layer.cornerRadius = 10
        textfield.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3474234272)
        textfield.layer.borderWidth = 1
        textfield.keyboardType = .asciiCapable
        textfield.autocorrectionType = .no
        textfield.delegate = self
        textfield.text = Singleton.shared.name
        textfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    lazy var firstLastnameTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Apellido Paterno"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstLastnameTextfield: UITextField = {
       let textfield = UITextField()
        textfield.backgroundColor = .white
        textfield.textColor = .black
        textfield.placeholder = "Apellido Paterno"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textfield.leftViewMode = .always
        textfield.inputAccessoryView = toolBar
        textfield.layer.cornerRadius = 10
        textfield.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3474234272)
        textfield.layer.borderWidth = 1
        textfield.keyboardType = .asciiCapable
        textfield.autocorrectionType = .no
        textfield.delegate = self
        textfield.text = Singleton.shared.firstLastName
        textfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    lazy var secondLastnameTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Apellido Materno"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondLastnameTextfield: UITextField = {
       let textfield = UITextField()
        textfield.backgroundColor = .white
        textfield.textColor = .black
        textfield.placeholder = "Apellido Materno"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textfield.leftViewMode = .always
        textfield.inputAccessoryView = toolBar
        textfield.layer.cornerRadius = 10
        textfield.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3474234272)
        textfield.layer.borderWidth = 1
        textfield.keyboardType = .asciiCapable
        textfield.autocorrectionType = .no
        textfield.delegate = self
        textfield.text = Singleton.shared.secondLastName
        textfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    lazy var emailTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Correo electrónico"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     lazy var emailTextfield: UITextField = {
       let textfield = UITextField()
        textfield.backgroundColor = .white
        textfield.textColor = .black
        textfield.placeholder = "Correo electrónico"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textfield.leftViewMode = .always
        textfield.inputAccessoryView = toolBar
        textfield.layer.cornerRadius = 10
        textfield.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3474234272)
        textfield.layer.borderWidth = 1
        textfield.keyboardType = .asciiCapable
        textfield.autocorrectionType = .no
        textfield.delegate = self
        textfield.text = Singleton.shared.eMail
        textfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    lazy var cellPhoneTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Teléfono celular"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cellPhoneTextfield: UITextField = {
       let textfield = UITextField()
        textfield.backgroundColor = .white
        textfield.textColor = .black
        textfield.placeholder = "Teléfono celular"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textfield.leftViewMode = .always
        textfield.inputAccessoryView = toolBar
        textfield.layer.cornerRadius = 10
        textfield.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3474234272)
        textfield.layer.borderWidth = 1
        textfield.keyboardType = .numberPad
        textfield.text = Singleton.shared.cellPhone
        textfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    lazy var continueButton: UIButton = {
       let button = UIButton()
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setTitle("Continuar", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextStepAction), for: .touchUpInside)
        button.setEnableButton(enable: false)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(delegate: RegisterViewUIDelegate) {
        self.init()
        self.backgroundColor = .white
        self.delegate = delegate
        setupUIElements()
        setupConstraints()
    }
    
    fileprivate func setupUIElements() {
        self.addSubview(headerView)
        headerView.addSubview(titleHeader)
        self.addSubview(topLine)
        self.addSubview(scrollView)
        scrollView.addSubview(cardView)
        cardView.addSubview(nameTitleLabel)
        cardView.addSubview(nameTextfield)
        cardView.addSubview(firstLastnameTitleLabel)
        cardView.addSubview(firstLastnameTextfield)
        cardView.addSubview(secondLastnameTitleLabel)
        cardView.addSubview(secondLastnameTextfield)
        cardView.addSubview(emailTitleLabel)
        cardView.addSubview(emailTextfield)
        cardView.addSubview(cellPhoneTitleLabel)
        cardView.addSubview(cellPhoneTextfield)
        cardView.addSubview(continueButton)
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.topAnchor, constant: -20),
            headerView.heightAnchor.constraint(equalToConstant: 120),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            titleHeader.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            titleHeader.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -5),
            
            topLine.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 5),
            topLine.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            topLine.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            topLine.heightAnchor.constraint(equalToConstant: 1),
            
            scrollView.topAnchor.constraint(equalTo: topLine.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            cardView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            cardView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            cardView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            nameTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            nameTitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            nameTitleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            nameTextfield.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor,constant: 10),
            nameTextfield.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
            nameTextfield.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
            nameTextfield.heightAnchor.constraint(equalToConstant: 50),
            
            firstLastnameTitleLabel.topAnchor.constraint(equalTo: nameTextfield.bottomAnchor, constant: 20),
            firstLastnameTitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            firstLastnameTitleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            firstLastnameTextfield.topAnchor.constraint(equalTo: firstLastnameTitleLabel.bottomAnchor,constant: 10),
            firstLastnameTextfield.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
            firstLastnameTextfield.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
            firstLastnameTextfield.heightAnchor.constraint(equalToConstant: 50),
            
            secondLastnameTitleLabel.topAnchor.constraint(equalTo: firstLastnameTextfield.bottomAnchor, constant: 20),
            secondLastnameTitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            secondLastnameTitleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            secondLastnameTextfield.topAnchor.constraint(equalTo: secondLastnameTitleLabel.bottomAnchor,constant: 10),
            secondLastnameTextfield.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
            secondLastnameTextfield.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
            secondLastnameTextfield.heightAnchor.constraint(equalToConstant: 50),
            
            emailTitleLabel.topAnchor.constraint(equalTo: secondLastnameTextfield.bottomAnchor, constant: 20),
            emailTitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            emailTitleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            emailTextfield.topAnchor.constraint(equalTo: emailTitleLabel.bottomAnchor,constant: 10),
            emailTextfield.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
            emailTextfield.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
            emailTextfield.heightAnchor.constraint(equalToConstant: 50),
            
            cellPhoneTitleLabel.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor, constant: 20),
            cellPhoneTitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            cellPhoneTitleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            cellPhoneTextfield.topAnchor.constraint(equalTo: cellPhoneTitleLabel.bottomAnchor,constant: 10),
            cellPhoneTextfield.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
            cellPhoneTextfield.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
            cellPhoneTextfield.heightAnchor.constraint(equalToConstant: 50),
            
            continueButton.topAnchor.constraint(equalTo: cellPhoneTextfield.bottomAnchor,constant: 30),
            continueButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
            continueButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor,constant: -30),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func finishEditing() {
        self.endEditing(true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.emailTextfield.text = self.emailTextfield.text?.lowercased()
        let nonEmptyCondition = (!(self.nameTextfield.text?.isEmpty ?? true) && !(self.firstLastnameTextfield.text?.isEmpty ?? true) && !(self.secondLastnameTextfield.text?.isEmpty ?? true) && !(self.emailTextfield.text?.isEmpty ?? true) && !(self.cellPhoneTextfield.text?.isEmpty ?? true))
        
        self.continueButton.setEnableButton(enable: nonEmptyCondition)
    }
    
    @objc func nextStepAction(_ sender: UIButton){
        nextStepValidation()
    }
    
    func nextStepValidation() {
        let email = self.emailTextfield.text ?? ""
        guard email.isEmail() else{
            delegate?.nofifyFailureContinue(message: "Debes ingresar un e-mail válido")
            self.emailTextfield.layer.borderColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            return
        }
        self.emailTextfield.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3474234272)
        
        let phone = self.cellPhoneTextfield.text ?? ""
        guard phone.isPhoneNumber() else{
            delegate?.nofifyFailureContinue(message: "Debes ingresar un número telefónico válido")
            self.cellPhoneTextfield.layer.borderColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            return
        }
        self.cellPhoneTextfield.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3474234272)
        
        Singleton.shared.name = nameTextfield.text ?? ""
        Singleton.shared.firstLastName = firstLastnameTextfield.text ?? ""
        Singleton.shared.secondLastName = secondLastnameTextfield.text ?? ""
        Singleton.shared.eMail = emailTextfield.text ?? ""
        Singleton.shared.cellPhone = cellPhoneTextfield.text ?? ""
        
        delegate?.notifyContinue()
    }
}

extension RegisterViewUI: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == nameTextfield || textField == firstLastnameTextfield || textField == secondLastnameTextfield {
            if(string == " " && range.location == 0){
                return false
            }else if(string != ""){
                return string.range(of: ".*[A-Za-z ñÑáéíóúÁÉÍÓÚüÜ].*",options: .regularExpression) != nil
            }
        }
        
        if textField == emailTextfield {
            if(string == " " && range.location == 0){
                return false
            }else if(string != ""){
                return true
            }
        }
        return true
    }
}
