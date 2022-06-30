//
//  LandingView.swift
//  LemonadeTest
//
//  Created by Abdullah on 30/06/2022.
//

import Foundation
import UIKit

class LandingView: BaseView {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LandingLeftCell.self, forCellReuseIdentifier: "LandingLeftCell")
        tableView.register(LandingRightCell.self, forCellReuseIdentifier: "LandingRightCell")
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    var students: [Student]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func setup() {
        super.setup()
        addSubview(tableView)
        tableView.fillUpSuperview()
    }
}

extension LandingView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var resuableCell: UITableViewCell?
        
        if (indexPath.row + 1) % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LandingRightCell", for: indexPath) as! LandingRightCell
            if let student = students?[indexPath.row] {
                cell.updateCellWithData(student: student)
            }
            resuableCell = cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LandingLeftCell") as! LandingLeftCell
            if let student = students?[indexPath.row] {
                cell.updateCellWithData(student: student)
            }
            resuableCell = cell
        }
        return resuableCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}

class LandingLeftCell: BaseTableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Lynd Johnson"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "17 years | BioChemistry | NN444"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(hex: "#7E7E7E")
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()

    let studentImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.layer.cornerRadius = 12
        img.clipsToBounds = true
        img.backgroundColor = .darkGray.withAlphaComponent(0.5)
        return img
    }()
    
    let container = UIView()
    override func setup() {
        super.setup()
        
        addSubview(container)
        container.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, margin: .init(top: 10, left: 10, bottom: 10, right: 10))
        
        container.addSubviews(studentImg, nameLabel, descriptionLabel)
        studentImg.anchor(top: container.topAnchor, leading: container.leadingAnchor, bottom: container.bottomAnchor, margin: .init(top: 10, left: 10, bottom: 10, right: 0), size: .init(width: 60, height: 0))
        
        nameLabel.anchor(top: studentImg.topAnchor, leading: studentImg.trailingAnchor, trailing: container.trailingAnchor, margin: .init(top: 7, left: 15, bottom: 0, right: 14))
        
        descriptionLabel.anchor(top: nameLabel.bottomAnchor, leading: studentImg.trailingAnchor, trailing: container.trailingAnchor, margin: .init(top: 5, left: 14, bottom: 0, right: 14))
        
    }
    
    func updateCellWithData(student: Student) {
        nameLabel.text = student.name ?? "Not found"
        descriptionLabel.text = "\(student.age ?? 0) | \(student.department ?? "Not Found") | \(student.profileID ?? "Not Found")"
        studentImg.showImage(url: student.avatar ?? "")
    }
}

class LandingRightCell: BaseTableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Lynd Johnson"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .right
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "17 years | BioChemistry | NN444"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(hex: "#7E7E7E")
        label.textAlignment = .right
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()

    let studentImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.layer.cornerRadius = 12
        img.clipsToBounds = true
        img.backgroundColor = .darkGray.withAlphaComponent(0.5)
        return img
    }()
    
    let container = UIView()
    
    override func setup() {
        super.setup()
        
        addSubview(container)
        container.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, margin: .init(top: 10, left: 10, bottom: 10, right: 10))
        
        container.addSubviews(studentImg, nameLabel, descriptionLabel)
        studentImg.anchor(top: container.topAnchor, bottom: container.bottomAnchor, trailing: container.trailingAnchor, margin: .init(top: 10, left: 0, bottom: 10, right: 10), size: .init(width: 60, height: 0))
        
        nameLabel.anchor(top: studentImg.topAnchor, leading: container.leadingAnchor, trailing: studentImg.leadingAnchor, margin: .init(top: 7, left: 14, bottom: 0, right: 14))
        
        descriptionLabel.anchor(top: nameLabel.bottomAnchor, leading: container.leadingAnchor, trailing: studentImg.leadingAnchor, margin: .init(top: 5, left: 14, bottom: 0, right: 14))
    
    }

    func updateCellWithData(student: Student) {
        nameLabel.text = student.name ?? "Not found"
        descriptionLabel.text = "\(student.profileID ?? "Not Found") | \(student.department ?? "Not Found") | \(student.age ?? 0)"
        studentImg.showImage(url: student.avatar ?? "")
    }
}
