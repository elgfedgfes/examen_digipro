//
//  UserInformationViewUI.swift
//  ExameniOS
//
//  Created by Luis Fernando Sánchez Palma on 30/03/23.
//

import UIKit

protocol UserInformationViewUIDelegate {
    func notifyNavigateBack()
}

class UserInformationViewUI: UIView {
    var delegate: UserInformationViewUIDelegate?
    
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
        label.text = "Finalizado"
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
    
    lazy var welcomeTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "¡Bienvenido!"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var completeNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "\(Singleton.shared.name ?? "") \(Singleton.shared.firstLastName ?? "") \(Singleton.shared.secondLastName ?? "")"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "A continuacuón se mostrará el resumen de tus datos capturados mediante el patrón de diseño Singleton"
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var eMailTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "E-mail:"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var eMailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Singleton.shared.eMail ?? ""
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cellPhoneTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Número celular:"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cellPhoneLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Singleton.shared.cellPhone ?? ""
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var backButton: UIButton = {
       let button = UIButton()
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setTitle("Regresar", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        button.setEnableButton(enable: true)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(delegate: UserInformationViewUIDelegate){
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
        self.addSubview(cardView)
        cardView.addSubview(welcomeTitleLabel)
        cardView.addSubview(completeNameLabel)
        cardView.addSubview(descriptionLabel)
        cardView.addSubview(eMailTitleLabel)
        cardView.addSubview(eMailLabel)
        cardView.addSubview(cellPhoneTitleLabel)
        cardView.addSubview(cellPhoneLabel)
        cardView.addSubview(backButton)
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
            
            cardView.topAnchor.constraint(equalTo: topLine.bottomAnchor),
            cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cardView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            welcomeTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            welcomeTitleLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            
            completeNameLabel.topAnchor.constraint(equalTo: welcomeTitleLabel.bottomAnchor, constant: 20),
            completeNameLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: completeNameLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            eMailTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            eMailTitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            eMailTitleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            eMailLabel.topAnchor.constraint(equalTo: eMailTitleLabel.bottomAnchor, constant: 20),
            eMailLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            eMailLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            cellPhoneTitleLabel.topAnchor.constraint(equalTo: eMailLabel.bottomAnchor, constant: 20),
            cellPhoneTitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            cellPhoneTitleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            cellPhoneLabel.topAnchor.constraint(equalTo: cellPhoneTitleLabel.bottomAnchor, constant: 20),
            cellPhoneLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            cellPhoneLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            backButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor,constant: -30),
            backButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
            backButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
            backButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func backButtonAction(_ sender: UIButton){
        delegate?.notifyNavigateBack()
    }
}
