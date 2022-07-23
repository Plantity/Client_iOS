//
//  SearchViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/22.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Delegate
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        // Register Nib
        let searchNib = UINib(nibName: "SearchTableViewCell", bundle: nil)
        searchTableView.register(searchNib, forCellReuseIdentifier: "SearchTableViewCell")
        
        setupAttribute()
    }

    private func setupAttribute() {
        searchTableView.separatorStyle = .none
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = searchTableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else { return SearchTableViewCell() }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 480
    }
}
