//
//  SearchViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/22.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchController = UISearchController()
    var resultVC = UITableViewController()
    
    var fileteredData: [String] = []
    var dataArray: [String] = ["One", "Two", "Three"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Delegate
        searchTableView.delegate = self
        
        searchTableView.dataSource = self
        searchBar.delegate = self
        searchController.delegate = self
        
        searchController = UISearchController(searchResultsController: resultVC)
        //usally good to set the presentation context
        self.definesPresentationContext = true
        searchController.searchBar.delegate = self
        searchController.delegate = self
        
        resultVC.tableView.delegate = self
        resultVC.tableView.dataSource = self
        
        // Register Nib
            // for Table View
        let searchNib = UINib(nibName: "SearchTableViewCell", bundle: nil)
        searchTableView.register(searchNib, forCellReuseIdentifier: "SearchTableViewCell")
            // for Collection View
        let tagNib = UINib(nibName: "TagTableViewCell", bundle: nil)
        searchTableView.register(tagNib, forCellReuseIdentifier: "TagTableViewCell")
        
        setupAttribute()
    }

    private func setupAttribute() {
        //searchTableView.separatorStyle = .none
    }
    
    
    
}

// MARK: - Extension
// for searchBar
extension SearchViewController:
    UISearchBarDelegate,
    UISearchControllerDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.barTintColor = .searchBarOnClickColor
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.text = searchText
        fileteredData = dataArray.filter({ (data:String) -> Bool in
            return data.lowercased().contains(searchBar.text!.lowercased())
            })
        
        searchTableView.reloadData()
    }
}

// for collectionView
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "TagCollectionViewCell",
            for: indexPath) as? TagCollectionViewCell
        else { return UICollectionViewCell() }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
}

// for tableView
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? TagTableViewCell else { return }

        tableViewCell.setCollectionViewDataSourceDelegate(
            dataSourceDelegate: self,
            forRow: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.text?.count != 0 {
            // 검색 결과
            return fileteredData.count
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if searchBar.text?.count != 0 {
            // 검색 결과
            //let cell = UITableViewCell()
            //cell.textLabel?.text = (tableView == searchTableView ? fileteredData[indexPath.row] : dataArray[indexPath.row])
            
            guard let cell = searchTableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell
            else { return UITableViewCell() }
            
            return cell
        }
        
        if indexPath.row == 0 {
            // 인덱스 0번 셀일 경우 tag CollectionView
            guard let cell = searchTableView.dequeueReusableCell(
                withIdentifier: "TagTableViewCell",
                for: indexPath) as? TagTableViewCell
            else { return UITableViewCell() }
            
            return cell
        } else {
            guard let cell = searchTableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else { return SearchTableViewCell() }
            
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if searchBar.text?.count != 0 {
            // 검색 결과
            return 150
        }
        
        if indexPath.row == 0 {
            return 140
        } else {
            return 600
        }
    }
}
