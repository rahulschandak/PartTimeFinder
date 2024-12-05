//
//  JobsTableViewCell.swift
//  PartTimeFinder
//
//  Created by Haris Gunasekaran on 11/24/24.
//

import UIKit

class JobsTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var jobImageView: UIImageView!
    var labelJobName: UILabel!
    var labelJobCompany: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupWrapperCellView()
        setupJobImageView()
        setupLabelJobName()
        setupLabelJobCompany()

        initConstraints()
    }

    func setupWrapperCellView() {
        wrapperCellView = UIView()
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 12.0  // Rounded corners for the card
        wrapperCellView.layer.shadowColor = UIColor.black.cgColor  // Soft shadow effect
        wrapperCellView.layer.shadowOffset = CGSize(width: 0, height: 4) // Soft lift effect
        wrapperCellView.layer.shadowRadius = 6.0
        wrapperCellView.layer.shadowOpacity = 0.1  // Subtle shadow
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }

    func setupJobImageView() {
        jobImageView = UIImageView()
        jobImageView.contentMode = .scaleAspectFill
        jobImageView.clipsToBounds = true
        jobImageView.layer.cornerRadius = 30.0  // Circular image
        jobImageView.layer.borderWidth = 2.0    // Border around the image
        jobImageView.layer.borderColor = UIColor.lightGray.cgColor  // Light border
        jobImageView.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(jobImageView)
    }

    func setupLabelJobName() {
        labelJobName = UILabel()
        labelJobName.font = UIFont.boldSystemFont(ofSize: 18)
        labelJobName.numberOfLines = 1
        labelJobName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelJobName)
    }

    func setupLabelJobCompany() {
        labelJobCompany = UILabel()
        labelJobCompany.font = UIFont.systemFont(ofSize: 16)
        labelJobCompany.textColor = .darkGray
        labelJobCompany.numberOfLines = 1
        labelJobCompany.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelJobCompany)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),

            jobImageView.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            jobImageView.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 16),
            jobImageView.widthAnchor.constraint(equalToConstant: 60),  // Circular image size
            jobImageView.heightAnchor.constraint(equalTo: jobImageView.widthAnchor), // Maintain circle shape

            labelJobName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 16),
            labelJobName.leadingAnchor.constraint(equalTo: jobImageView.trailingAnchor, constant: 16),
            labelJobName.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -16),

            labelJobCompany.topAnchor.constraint(equalTo: labelJobName.bottomAnchor, constant: 8),
            labelJobCompany.leadingAnchor.constraint(equalTo: labelJobName.leadingAnchor),
            labelJobCompany.trailingAnchor.constraint(equalTo: labelJobName.trailingAnchor),
            labelJobCompany.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -16),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
