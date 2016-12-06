//
//  ViewController.swift
//  DeepLink-Demo
//
//  Created by Aynur Galiev on 6.декабря.2016.
//  Copyright © 2016 Aynur Galiev. All rights reserved.
//

import UIKit

struct Movie {
    var name: String
    var description: String
    var image: String
    var genre: String
    var isSelected: Bool = false
    
    init(name: String, genre: String, description: String, image: String) {
        self.name = name
        self.genre = genre
        self.description = description
        self.image = image
    }
}

var movies: [Movie] = []

final class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.generateMovies()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100
    }

    override func viewWillLayoutSubviews() {
        self.tableView.contentInset = UIEdgeInsets.zero
    }
    
    private func generateMovies() {
        
        var movie = Movie(name: "Inferno", genre: "Drama, Thriller", description: "Academy Award® winner Ron Howard returns to direct the latest bestseller in Dan Brown's (Da Vinci Code) billion-dollar Robert Langdon series, Inferno, which finds the famous symbologist (again played by Tom Hanks) on a trail of clues tied to the great Dante himself. When Langdon wakes up in an Italian hospital with amnesia, he teams up with Sienna Brooks (Felicity Jones), a doctor he hopes will help him recover his memories. Together, they race across Europe and against the clock to stop a madman from unleashing a global virus that would wipe out half of the world's population.", image: "Inferno.jpg")
        movies.append(movie)
        
        movie = Movie(name: "Snowden", genre: "Drama, action, biography", description: "SNOWDEN stars Joseph Gordon-Levitt and is written and directed by Oliver Stone. The script is based on the books The Snowden Files: The Inside Story of the World's Most Wanted Man by Luke Harding and Time of the Octopus by Anatoly Kucherena.", image: "Snowden.jpg")
        movies.append(movie)
        
        movie = Movie(name: "Sully", genre: "Drama, biography", description: "On Thursday, January 15th, 2009, the world witnessed the \"Miracle on the Hudson\" when Captain Chesley Sullenberger, nicknamed \"Sully\" & is portrayed by Tom Hanks glided his disabled plane onto the frigid waters of the Hudson River, saving the lives of all 155 aboard. However, even as Sully was being heralded by the public and the media for his unprecedented feat of aviation skill, an investigation was unfolding that threatened to destroy his reputation and his career.", image: "Sully.jpg")
        movies.append(movie)
        
        movie = Movie(name: "The Flash 3", genre: "Adventure, action", description: "Barry Allen is a Central City police forensic scientist with a reasonably happy life, despite the childhood trauma of a mysterious red and yellow lightning killing his mother and framing his father. All that changes when a massive particle accelerator accident leads to Barry being struck by lightning in his lab. Coming out of coma nine months later, Barry and his new friends at S.T.A.R labs find that he now has the ability to move at superhuman speed. Furthermore, Barry learns that he is but one of many affected by that event, most of whom are using their powers for evil. Determined to make a difference, Barry dedicates his life to fighting such threats, as The Flash. While he gains allies he never expected, there are also secret forces determined to aid and manipulate him for their own agenda.", image: "The Flash 3.jpg")
        movies.append(movie)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MovieCell
        cell.prepareCell(movie: movies[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        movies[indexPath.row].isSelected = !movies[indexPath.row].isSelected
        self.tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        self.tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: true)
    }
}
