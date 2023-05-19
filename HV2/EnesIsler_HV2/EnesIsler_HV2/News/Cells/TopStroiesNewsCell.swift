//
//  TopStroiesNewsCell.swift
//  EnesIsler_HV2
//
//  Created by Enes İşler on 17.05.2023.
//

import UIKit
import NewsAPI
import SDWebImage

class TopStroiesNewsCell: UITableViewCell {
    
    
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var author: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(news: News) {
        preparePosterImage(with: news.multimedia?[2].url)
        preparePosterImage(with: news.multimedia?[1].url)
        newsTitle.text = news.title
        author.text = news.byline
        //var url = news.url
        //var abstract = news.abstract
        
    }
    
    
    
    
    
    
    
    private func preparePosterImage(with urlString: String?) {
        let fullPath = urlString!
        if let url = URL(string: fullPath ) {
            newsImage.sd_setImage(with: url)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
