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
    
    var fileteredData: [SearchPlantModel] = []
    var dataArray: [SearchPlantModel] = [
        SearchPlantModel(name: "몬스테라", level: 1, intro: "자라면서 잎에 구멍이 생기는 것으로 유명한 인테리어 식물", water: "물을 7일에 한 번씩 흙이 마르면 주세요.", sun: "햇빛이 적당한 것을 좋아해요", isUserLiked: false, tag: "# 플렌테리어")
    ]
    
    
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
        let resultNib = UINib(nibName: "ResultTableViewCell", bundle: nil)
        searchTableView.register(resultNib, forCellReuseIdentifier: "ResultTableViewCell")
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
        fileteredData = dataArray.filter({ (data: SearchPlantModel) -> Bool in
            return data.name?.lowercased().contains(searchBar.text!.lowercased()) ?? false
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
            
            guard let cell = searchTableView.dequeueReusableCell(
                withIdentifier: "ResultTableViewCell",
                for: indexPath) as? ResultTableViewCell
            else { return UITableViewCell() }
            
            if tableView == searchTableView {
                cell.setupData(
                    name:
                    fileteredData[indexPath.row].name,
                    level: fileteredData[indexPath.row].level,
                    intro: fileteredData[indexPath.row].intro,
                    tag: fileteredData[indexPath.row].tag
                )
            } else {
                cell.setupData(
                    name:
                        dataArray[indexPath.row].name,
                    level: dataArray[indexPath.row].level,
                    intro: dataArray[indexPath.row].intro,
                    tag: dataArray[indexPath.row].tag
                )
            }
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchBar.text?.count != 0 {
            // 검색결과 선택시 식물 상세보기 페이지로 이동
            let storyboard = UIStoryboard(name: "SearchPage", bundle: nil)
            
            let plantViewController = storyboard.instantiateViewController(withIdentifier: "PlantViewController") as! PlantViewController
            
            plantViewController.searchPlant = fileteredData[indexPath.row]
            
            self.navigationController?.pushViewController(plantViewController, animated: true)
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
