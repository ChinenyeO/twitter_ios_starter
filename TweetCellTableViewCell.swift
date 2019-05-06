//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by chinenye ogbuchiekwe on 4/28/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    var favorited:Bool = false
    var tweetId: Int = -1
    var retweeted:Bool = false
    
     
    @IBAction func favAction(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited){
            TwitterAPICaller.client?.favorTweet(tweetID:  tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Did not favorite \(error)")
            })
            
            
        }
        else{
            TwitterAPICaller.client?.unfavorTweet(tweetID: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite did not work \(error )")
            })
            
        }
        
    }
    @IBAction func retweetAction(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetID: tweetId, success: {
           self.setRetweeted(true)
        }, failure: { (error) in
            print("unable to retweet \(error) ")
        })
    }
    
   
    func setFavorite(_ isfavorite:Bool){
        favorited = isfavorite
        if(favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal )
        }
        else{
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal )
        }
    }
    
    func setRetweeted(_ isRetweeted:Bool){
        retweeted = isRetweeted
        if(retweeted){
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
            
        }
        else{

            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
            
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
