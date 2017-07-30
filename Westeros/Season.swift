//
//  Season.swift
//  Westeros
//
//  Created by Administrador on 30/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit

final class Season{
    let title: String
    let airDate: Date
    let episodes: [Episode]
    let image: UIImage
    
    init?(title: String, episodes: [Episode], image: UIImage){
        if episodes.count == 0 {
            return nil
        }
        self.title = title
        self.airDate = episodes[0].airDate
        self.episodes = episodes
        self.image = image
        
        for episode in episodes {
            episode.addSeason(season: self)
        }
    }
}

extension Season: CustomStringConvertible{
    var description: String {
        return "\(self.title). \(self.episodes.count) episode/s"
    }
}

extension Season: Equatable{
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return (lhs.title, lhs.airDate) == (rhs.title, rhs.airDate)
    }


}

extension Season: Hashable{
    var hashValue: Int {
        return description.hashValue
    }


}

extension Season: Comparable{
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.airDate < rhs.airDate
    }


}
