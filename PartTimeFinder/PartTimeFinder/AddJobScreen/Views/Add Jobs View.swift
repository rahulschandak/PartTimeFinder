//
//  AddJobsView.swift
//  PartTimeFinder
//
//  Created by Haris Gunasekaran on 11/19/24.
//

import UIKit

class AddJobsView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    // New job-related fields
    var textFieldJobCompany: UITextField!
    var textViewJobDesc: UITextView!
    var textFieldJobName: UITextField!
    var textFieldJobPosterEmail: UITextField!
    var textFieldJobPostingDate: UITextField!
    
    var labelPhoto: UILabel!
    var buttonTakePhoto: UIButton!
    var buttonRegister: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        // New setup methods for job-related fields
        setuptextFieldJobCompany()
        setuptextFieldJobDesc()
        setuptextFieldJobName()
        setuptextFieldJobPosterEmail()
        setuptextFieldJobPostingDate()
        
        setuplabelPhoto()
        setupbuttonTakePhoto()
        
        setupbuttonRegister()
        
        initConstraints()
    }

    func setupbuttonRegister(){
              buttonRegister = UIButton(type: .system)
              buttonRegister.setTitle("Add Job", for: .normal)
              buttonRegister.titleLabel?.font = .boldSystemFont(ofSize: 16)
              buttonRegister.translatesAutoresizingMaskIntoConstraints = false
              self.addSubview(buttonRegister)
    }
    
    func setuplabelPhoto(){
          labelPhoto = UILabel()
          labelPhoto.text = "Add Image"
          labelPhoto.font = UIFont.boldSystemFont(ofSize: 14)
          labelPhoto.translatesAutoresizingMaskIntoConstraints = false
          self.addSubview(labelPhoto)
      }
      
      func setupbuttonTakePhoto(){
          buttonTakePhoto = UIButton(type: .system)
          buttonTakePhoto.setTitle("", for: .normal)
          buttonTakePhoto.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
          //buttonTakePhoto.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
          buttonTakePhoto.contentHorizontalAlignment = .fill
          buttonTakePhoto.contentVerticalAlignment = .fill
          buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
          buttonTakePhoto.showsMenuAsPrimaryAction = true
          buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
          self.addSubview(buttonTakePhoto)
      }
    
    func setuptextFieldJobCompany() {
        textFieldJobCompany = UITextField()
        textFieldJobCompany.placeholder = "Company"
        textFieldJobCompany.keyboardType = .default
        textFieldJobCompany.borderStyle = .roundedRect
        textFieldJobCompany.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldJobCompany)
    }

    func setuptextFieldJobDesc() {
            textViewJobDesc = UITextView()
            textViewJobDesc.text = "Enter job description here..."
            textViewJobDesc.font = UIFont.systemFont(ofSize: 16)
            textViewJobDesc.textColor = .lightGray
            textViewJobDesc.layer.borderColor = UIColor.gray.cgColor
            textViewJobDesc.layer.borderWidth = 1.0
            textViewJobDesc.layer.cornerRadius = 5.0
            textViewJobDesc.translatesAutoresizingMaskIntoConstraints = false
            textViewJobDesc.isScrollEnabled = true // Allows scrolling for long text
            textViewJobDesc.isEditable = true
            textViewJobDesc.isSelectable = true

            // Optionally, add placeholder behavior
           // textViewJobDesc.delegate = self // Set the delegate to self to manage placeholder behavior
            self.addSubview(textViewJobDesc)
    }

    func setuptextFieldJobName() {
        textFieldJobName = UITextField()
        textFieldJobName.placeholder = "Job Title"
        textFieldJobName.keyboardType = .default
        textFieldJobName.borderStyle = .roundedRect
        textFieldJobName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldJobName)
    }

    func setuptextFieldJobPosterEmail() {
        textFieldJobPosterEmail = UITextField()
        textFieldJobPosterEmail.placeholder = "Job Poster Email"
        textFieldJobPosterEmail.keyboardType = .emailAddress
        textFieldJobPosterEmail.borderStyle = .roundedRect
        textFieldJobPosterEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldJobPosterEmail)
    }

    func setuptextFieldJobPostingDate() {
        textFieldJobPostingDate = UITextField()
        textFieldJobPostingDate.placeholder = "Posting Date"
        textFieldJobPostingDate.keyboardType = .default
        textFieldJobPostingDate.borderStyle = .roundedRect
        textFieldJobPostingDate.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldJobPostingDate)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
           
            // New constraints for job-related fields
            textFieldJobCompany.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            textFieldJobCompany.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldJobCompany.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
//            textViewJobDesc.topAnchor.constraint(equalTo: textFieldJobCompany.bottomAnchor, constant: 16),
//            textViewJobDesc.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
//            textViewJobDesc.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
                textViewJobDesc.topAnchor.constraint(equalTo: textFieldJobCompany.bottomAnchor, constant: 16),
                textViewJobDesc.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                textViewJobDesc.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
                textViewJobDesc.heightAnchor.constraint(equalToConstant: 100), // Adjust height for multi-line input
            
            textFieldJobName.topAnchor.constraint(equalTo: textViewJobDesc.bottomAnchor, constant: 16),
            textFieldJobName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldJobName.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldJobPosterEmail.topAnchor.constraint(equalTo: textFieldJobName.bottomAnchor, constant: 16),
            textFieldJobPosterEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldJobPosterEmail.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldJobPostingDate.topAnchor.constraint(equalTo: textFieldJobPosterEmail.bottomAnchor, constant: 16),
            textFieldJobPostingDate.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldJobPostingDate.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            // Existing layout for photo and register button
            buttonTakePhoto.topAnchor.constraint(equalTo: textFieldJobPostingDate.bottomAnchor, constant: 16),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            labelPhoto.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor),
            labelPhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonRegister.topAnchor.constraint(equalTo: labelPhoto.bottomAnchor, constant: 32),
            buttonRegister.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
