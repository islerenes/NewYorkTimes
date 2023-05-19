//
//  NewsViewController.swift
//  EnesIsler_HV2
//
//  Created by Enes İşler on 18.05.2023.
//

import UIKit
import SDWebImage
import NewsAPI
import SafariServices

final class NewsViewController: UIViewController{

    let services: TopStoriesNewsServiceProtocol = TopStoriesNewsService()

    var selectedTitle = ""
    var selectedUrl = ""
    var selectedAbstract = ""
    var selectedImage = ""
    @IBOutlet weak var largeImage: UIImageView!
    @IBOutlet weak var abstract: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        preparePosterImage(with: selectedImage)
        titleLabel.text = selectedTitle
        abstract.text = selectedAbstract
        urlLabel.text = selectedUrl
    }
    
    @IBAction func SeeMoreDetailsButton(_ sender: Any) {
        let url = urlLabel.text!
        guard let urll = URL(string: url) else { return }
        let browser = SFSafariViewController(url:urll)
        present(browser, animated: true, completion: nil)
    }
    
    private func preparePosterImage(with urlString: String?) {
        let fullPath = urlString
        if let url = URL(string: fullPath ?? "") {
            largeImage.sd_setImage(with: url)
        }
        
    }
    
}
