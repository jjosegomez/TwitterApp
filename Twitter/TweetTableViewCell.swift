//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Juan Jose Gomez Medina on 2/15/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    var favorited:Bool = false
    var tweetId:Int = -1

    @IBOutlet weak var ProfileImageView: UIImageView!
    @IBOutlet weak var UserNameLabel: UILabel!
    @IBOutlet weak var TweetContent: UILabel!
    @IBOutlet weak var FavButton: UIButton!
    @IBOutlet weak var RetweetButton: UIButton!
    
    
    @IBAction func FavoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("favorite did not suceed: \(error)")
            })
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: {(error) in print("Unfavorite was not succesful: \(error)")
            })
            }
    }
    
    
    @IBAction func Retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("could no retweet")
        })
    }
    
    func setRetweeted(_ isRetweeted:Bool){
        if (isRetweeted) {
            RetweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            RetweetButton.isEnabled = false
        } else {
            RetweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            RetweetButton.isEnabled = true
        }
    }
    
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if(favorited){
            FavButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            FavButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
