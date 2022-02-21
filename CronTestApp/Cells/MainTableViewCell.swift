//
//  MainTableViewCell.swift
//  CronTestApp
//
//  Created by Jafar on 21.02.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    let personPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let personNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline, compatibleWith:  .current)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let personCompany: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var stackView = UIStackView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.addSubview(personPhoto)
        
        stackView = UIStackView(arrangedSubviews: [personNameLabel,personCompany],
                                axis: .vertical,
                                spacing: 3,
                                distribution: .equalCentering)
        self.addSubview(stackView)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            personPhoto.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            personPhoto.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            personPhoto.heightAnchor.constraint(equalToConstant: 60),
            personPhoto.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: personPhoto.topAnchor, constant: 2),
            stackView.leadingAnchor.constraint(equalTo: personPhoto.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}
