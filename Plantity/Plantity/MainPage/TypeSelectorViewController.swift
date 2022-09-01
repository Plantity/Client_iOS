//
//  TypeSelectorViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/09/01.
//

import UIKit

class TypeSelectorViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var typeTableView: UITableView!
    
    var filteredList: [SearchPlantModel] = []
    var plantList : [SearchPlantModel] = [] {
        didSet { self.typeTableView.reloadData() }
    }

    var pageNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        typeTableView.delegate = self
        typeTableView.dataSource = self

        setupData(pageNum: pageNum)
    }
    
    private func setupData(pageNum: Int) {
        // To Server
        let input = SearchDataInput(size: 10, page: pageNum)
        
        SearchDataManager().selectorDataManager(input, self)
    }
    
    
    func successAPI(_ result: SearchDataModel?) {
        var isLastPage: Bool = false
        
        if let resultData : SearchDataModelResult = result?.result {
            plantList += resultData.content
            isLastPage = resultData.last
            self.pageNum += 1
        }
        
        // 마지막 페이지가 아니라면 계속 받아오기
        if !isLastPage {
            self.setupData(pageNum: self.pageNum)
        }
    }
}

extension TypeSelectorViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredList.isEmpty {
            return filteredList.count
        } else {
            return plantList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        
        if !filteredList.isEmpty {
            cell.textLabel?.text = filteredList[indexPath.row].cntntsSj;
        } else {
            cell.textLabel?.text = plantList[indexPath.row].cntntsSj;
        }
        
        return cell;
    }
    
    
}

extension TypeSelectorViewController:
    UISearchBarDelegate,
    UISearchControllerDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.barTintColor = .searchBarOnClickColor
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.text = searchText
        
        filteredList = plantList.filter({ (data: SearchPlantModel) -> Bool in
            return data.cntntsSj.lowercased().contains(searchBar.text!.lowercased())
            })
        
        print(filteredList)
        
        typeTableView.reloadData()
    }
}
