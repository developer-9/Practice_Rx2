//
//  NewsController.swift
//  GoodNews
//
//  Created by Taisei Sakamoto on 2021/03/09.
//

import UIKit
import RxSwift
import RxCocoa

private let reuseIdentifier = "ArticleCell"

class NewsController: UITableViewController {
    
    //MARK: - Properties
    
    let disposeBag = DisposeBag()
    
    private var articles = [Article]()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        populateNews()
    }
    
    //MARK: - Actions
    
    //MARK: - Helpers
    
    private func configureUI() {
        tableView.backgroundColor = .white
        navigationItem.title = "Good News"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ArticleCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 60
    }
    
    private func populateNews() {
//        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=jp&apiKey=7ee2551838e044c0b4ae992c8f572004")!
//
//        let resource = Resource<ArticlesList>(url: url)
        
        URLRequest.load(resource: ArticlesList.all)
            .subscribe(onNext: { [weak self] result in
                if let result = result {
                    self?.articles = result.articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
    }
}

//MARK: - UITableViewDataSource/UITableViewDelegate

extension NewsController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ArticleCell
        
        cell.titleLabel.text = articles[indexPath.row].title
        cell.descriptionLabel.text = articles[indexPath.row].description
        return cell
    }
}
