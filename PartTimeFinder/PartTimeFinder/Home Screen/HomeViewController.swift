//
//  HomeViewController.swift
//  PartTimeFinder
//
//  Created by Snehal Bondre on 11/22/24.
//

import UIKit
import PhotosUI
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class HomeViewController: UIViewController {
    
    let homeView = HomeView()

    
    var jobsList = [Jobs]()
    
    var filteredJobsList = [Jobs]() // List to store filtered jobs
    var isSearchActive = false // Flag to determine if the search is active
    
    
    let database = Firestore.firestore()
    
    var currentUser:FirebaseAuth.User?

        
    override func loadView() {
        view = homeView
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchJobs()
        
        if let url = self.currentUser?.photoURL
        {
            self.homeView.profilePic.loadRemoteImage(from: url)
        }
        
        
    }
    
    func fetchJobs() {
        
        self.database.collection("jobs")
            .addSnapshotListener(includeMetadataChanges: false, listener: { querySnapshot, error in
                if let documents = querySnapshot?.documents {
                    self.jobsList.removeAll()
                    for document in documents {
                        do {
                            let job = try document.data(as: Jobs.self)
                            self.jobsList.append(job)
                        } catch {
                            print(error)
                        }
                    }
                    self.jobsList.sort(by: { $0.jobPostingDate < $1.jobPostingDate })
                    self.homeView.tableViewJobs.reloadData()
                }
            })
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        title = "Home Screen"
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            title: "Profile", style: .plain, target: self,
//            action: #selector(onProfileBarButtonTapped)
//        )
        
        
        
//        navigationItem.rightBarButtonItem = homeView.profilePic(
//                    target: self,
//                    action: #selector(onProfileBarButtonTapped)
//        )
        
        homeView.tableViewJobs.delegate = self
        homeView.tableViewJobs.dataSource = self
        //MARK: removing the separator line...
        homeView.tableViewJobs.separatorStyle = .none
        
        homeView.searchBar.delegate = self


        homeView.floatingButtonAddJobs.addTarget(self, action: #selector(onJobDetailsButtonTapped), for: .touchUpInside)
        setupProfilePicGesture()
        print("hello")
    }
    
    func setupProfilePicGesture() {
         // Add a tap gesture recognizer to profilePic
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onProfilePicTapped))
         homeView.profilePic.isUserInteractionEnabled = true // Enable interaction on the image view
         homeView.profilePic.addGestureRecognizer(tapGesture)
         print("Gesture recognizer added to profilePic")  // Debugging print

     }
     
     @objc func onProfilePicTapped() {
         // Handle the profile picture tap
         print("Profile picture tapped!")
         // Add your navigation logic or actions here
         onProfileBarButtonTapped();
     }
    
    
    @objc func onProfileBarButtonTapped(){
        let profileScreen = ProfileViewController()
        navigationController?.pushViewController(profileScreen, animated: true)
    }
    
    @objc func onJobDetailsButtonTapped(){
        
        let addNewJob = AddJobsViewController()
        navigationController?.pushViewController(addNewJob, animated: true)

    }
    
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("inside searchbar")
        
        if searchText.isEmpty {
            isSearchActive = false
            filteredJobsList = jobsList // No filtering, show all jobs
            print("inside searchbar 1")

        } else {
            print("inside searchbar 2")

            isSearchActive = true
            filteredJobsList = jobsList.filter { job in
                return job.jobName.lowercased().contains(searchText.lowercased())
            }
        }
        homeView.tableViewJobs.reloadData() // Reload the table with filtered data
    }
    
    // Optionally, handle search bar cancel button tap
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("inside searchbar cancel")

        searchBar.text = ""
        isSearchActive = false
        filteredJobsList = jobsList // Reset to show all jobs
        homeView.tableViewJobs.reloadData()
    }
}