//
//  MovieCell.swift
//  DeepLink-Demo
//
//  Created by Aynur Galiev on 6.декабря.2016.
//  Copyright © 2016 Aynur Galiev. All rights reserved.
//

import UIKit

final class MovieCell: UITableViewCell {

    @IBOutlet weak var mainContentView: UIStackView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    private let descriptionLabel = UILabel()
    
    private var movie: Movie!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.font = UIFont.systemFont(ofSize: 13)
        self.descriptionLabel.textColor = UIColor.gray
        self.selectionStyle = .none
        self.movieImageView.clipsToBounds = true
        self.movieImageView.layer.cornerRadius = 3
    }
    
    func prepareCell(movie: Movie) {
        self.movie = movie
        if movie.isSelected {
            self.expand()
        } else {
            self.collapse()
        }
        self.movieImageView.image = UIImage(named: movie.image)
        self.nameLabel.text = movie.name
        self.genreLabel.text = movie.genre
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
    
    private func expand() {
        guard self.descriptionLabel.superview == nil else { return }
        self.descriptionLabel.text = self.movie?.description
        self.mainContentView.addArrangedSubview(self.descriptionLabel)
    }
    
    private func collapse() {
        guard self.descriptionLabel.superview != nil else { return }
        self.descriptionLabel.removeFromSuperview()
    }
}
