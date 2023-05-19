//
//  ViewController.swift
//  EnesIsler_HV2
//
//  Created by Enes İşler on 15.05.2023.
//

import UIKit
import NewsAPI

class ViewController: UIViewController, LoadingShowable {
   
    let services: TopStoriesNewsServiceProtocol = TopStoriesNewsService()
    var news: [News] = []
    var selectedTitle = ""
    var selectedUrl = ""
    var selectedImage = ""
    var selectedAbstract = ""
    
    
    @IBOutlet weak var tableViewController: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchNews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewController.register(UINib(nibName: "TopStoriesNewsCell", bundle: nil), forCellReuseIdentifier: "cityCell")
        tableViewController.register(cellType: TopStroiesNewsCell.self)
    }

    fileprivate func fetchNews() {
        self.showLoading()
        services.fetchTopStories { [weak self] response in
            guard let self else { return }
            self.hideLoading()
            switch response {
            case .success(let news):
                self.news = news
                tableViewController.reloadData()
            case .failure(let error):
                print("Enes\(error)")
            }
        }
    }
}



extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeCell(cellType: TopStroiesNewsCell.self, indexPath: indexPath)
        let news = self.news[indexPath.row]
        cell.configure(news: news)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = self.news[indexPath.row]
        selectedTitle = selected.title!
        selectedUrl = selected.url!
        selectedAbstract = selected.abstract!
        selectedImage = selected.multimedia?[1].url ?? "NoUrl"
        
        performSegue(withIdentifier: "GoToNewsDetail", sender: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToNewsDetail" {
            let destinationVC = segue.destination as! NewsViewController
            destinationVC.selectedTitle = self.selectedTitle
            destinationVC.selectedAbstract = self.selectedAbstract
            destinationVC.selectedUrl = self.selectedUrl
            destinationVC.selectedImage = self.selectedImage
        }
    }
    
}
