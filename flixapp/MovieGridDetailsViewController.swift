//
//  MovieGridDetailsViewController.swift
//  flixapp
//
//  Created by Adrian Lindell on 4/16/21.
//

import UIKit
import AlamofireImage

class MovieGridDetailsViewController: UIViewController {
    @IBOutlet weak var fullPosterView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var movie: [String:Any]!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let title = movie["title"] as! String
        let description = movie["overview"] as! String
        let date = movie["release_date"] as! String
        
        titleLabel.text = title
        descriptionLabel.text = description
        dateLabel.text = date
        
        titleLabel.sizeToFit()
        descriptionLabel.sizeToFit()
        dateLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185/"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        posterView.af.setImage(withURL: posterUrl!)
        
        let fullPosterViewPath = movie["backdrop_path"] as! String
        let fullPosterViewUrl = URL(string: "https://image.tmdb.org/t/p/w780/" + fullPosterViewPath)
        fullPosterView.af.setImage(withURL: fullPosterViewUrl!)
    }
    

/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        var trailerList = [[String:Any]]()
        var trailer = [String:Any]()
        
        let movieId = movie["id"] as! String
 // error unwrapping here
        
        // Query Get Videos using the selected movie's id
        let url = URL(string: "https://api.themoviedb.org/3/movie/" + movieId +
                        "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            //Store the trailers in a property to use elsewhere
            trailerList = dataDictionary["results"] as! [[String:Any]]
            //Get the first trailer
            trailer = trailerList[0]
           }
        }
        
        task.resume()
        
        let trailerPath = trailer["key"] as! String
        
        // Pass the trailer url to the trailer view controller
        let trailerViewController = segue.destination as! trailerViewController
        trailerViewController.trailerUrl = trailerPath
    }
    
*/
}
