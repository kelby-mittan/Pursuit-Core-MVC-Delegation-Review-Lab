//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController, FontSize {
    @IBOutlet weak var movieTableView: UITableView!
    
    private var movies = [Movie]() { // empty array
        didSet {
            movieTableView.reloadData()
        }
    }
    
    var fontSize: Double = 17.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movies = Movie.allMovies
        movieTableView.dataSource = self
        
    }
    
    func loadData() {
        movies = Movie.allMovies
    }
    
    
    
    @IBAction func updateUIFromUnwindSegue(segue: UIStoryboardSegue) {
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let movieVC = segue.destination as? FontSizeViewController else {
            fatalError()
        }
        movieVC.sizeDelegate = self
    }
    
    func changedFontSize(_ size: CGFloat) {
        self.fontSize = Double(size)
    }
    
}

extension MovieViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        
        let movie = movies[indexPath.row]
        
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = movie.year.description
        cell.imageView?.image = UIImage(named: movie.posterImageName)
        cell.textLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        
        return cell
    }
    
    
}


