//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Mubashirul Islam on 4/10/25.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {


    var post: Post!
    
    @IBOutlet weak var postImage: UIImageView!
    
    
    @IBOutlet weak var postText: UILabel!
    


    
    
    @IBOutlet weak var postTableView: UITableView!
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()

            // Configure the post text label
            postText.text = post.caption
            postText.numberOfLines = 0

            // Load image from URL
            if let imageURL = post.photos.first?.originalSize.url {
                loadImage(from: imageURL)
            }

            // Hide table view and table cell (if they were accidentally added)
            postTableView.isHidden = false
        }

        func loadImage(from url: URL) {
            // Load asynchronously to avoid blocking the main thread
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data,
                      let image = UIImage(data: data),
                      error == nil else {
                    print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }

                // Update UI on the main thread
                DispatchQueue.main.async {
                    self.postImage.image = image
                }
            }.resume()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


