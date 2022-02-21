//
//  MainViewController.swift
//  CronTestApp
//
//  Created by Jafar on 21.02.2022.
//

import UIKit
import Alamofire
import Nuke


class MainViewController: UIViewController {
    
    var persons: [Person] = []
    var items: [Displayable] = []
    var selectedItem: Displayable?
    
    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupDelegate()
        setConstraints()
        setNavigationBar()
        fetchPersons()
        
        self.tableView.reloadData()

    }
    
    func fetchPersons() {
        
        AF.request("http://app.cre.ru/api8/PlayersPersonList").validate().responseDecodable(of: Persons.self) { (response) in
          guard let persons = response.value else { return }
          self.persons = persons.all
          self.items = persons.all
          self.tableView.reloadData()

            

        }
    }
        

    
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    private func setupDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    private func setNavigationBar() {
        navigationItem.title = "Persons"
    }
    
    
      
    
}

//MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        
        cell.personNameLabel.text = item.personNameLabel
        cell.personCompany.text = item.personCompany
        
        
        let urlString = item.personPhoto
        DispatchQueue.main.async {
            Nuke.loadImage(with: urlString, into: cell.personPhoto)
        }
        

        
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
      selectedItem = items[indexPath.row]
      return indexPath
    }
}

//MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let url = items[indexPath.row].personPhoto
        let personsInfoViewController = PersonInfoViewController(urlPhoto: url)
        navigationController?.pushViewController(personsInfoViewController, animated: true)
        personsInfoViewController.data = selectedItem
    }
}

//MARK: - SetConstraints

extension MainViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

