//
//  PersonInfoViewController.swift
//  CronTestApp
//
//  Created by Jafar on 21.02.2022.
//

import UIKit
import Alamofire
import Nuke


class PersonInfoViewController: UIViewController {
    
    var urlPhoto: String?
    
    init(urlPhoto: String) {
        super.init(nibName: nil, bundle: nil)
        self.urlPhoto = urlPhoto
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let personPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let personNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .headline, compatibleWith:  .current)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let personPostTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Должность"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let personPostLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .headline, compatibleWith:  .current)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let companyNameTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Компания"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let companyNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .headline, compatibleWith:  .current)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let companyActivityTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Род деятельности"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let companyActivityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline, compatibleWith:  .current)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 84/255, green: 118/255, blue: 171/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.setTitle("Выход", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private var stackView = UIStackView()
    
    
    
    
    
    var data: Displayable?
    var listData: [Displayable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(personPhoto)
        view.addSubview(stackView)
        
        commonInit()
        setupViews()
        setConstraints()
        getPhoto()
    }
    
    private func commonInit() {
        guard let data = data else { return }
        
        personPhoto.image = personPhoto.image
        
        personNameLabel.text = data.personNameLabel
        companyNameLabel.text = data.personCompany
        
        personPostLabel.text = data.personPostLabel.label
        personPostLabel.text = data.personPostLabel.value
        
        companyActivityLabel.text = data.companyActivityLabel.label
        companyActivityLabel.text = data.companyActivityLabel.value
        
    }
    
    
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(personPhoto)
        
        stackView = UIStackView(arrangedSubviews: [
                                                personNameLabel,
                                                personPostTitleLabel,
                                                personPostLabel,
                                                companyNameTitleLabel,
                                                companyNameLabel,
                                                companyActivityTitleLabel,
                                                companyActivityLabel,
                                                backButton],
                                axis: .vertical,
                                spacing: 10,
                                distribution: .fillProportionally)
        
        view.addSubview(stackView)
        
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            personPhoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            personPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personPhoto.heightAnchor.constraint(equalToConstant: 100),
            personPhoto.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: personPhoto.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        
    }
    
    
    
    
}

extension PersonInfoViewController {
    func getPhoto() {
        if let url = urlPhoto {
            Nuke.loadImage(with: url, into: self.personPhoto)
        }
    }
}
