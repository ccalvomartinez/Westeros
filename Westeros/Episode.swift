//
//  Episode.swift
//  Westeros
//
//  Created by Administrador on 30/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation
final class Episode{
    let title: String
    let airDate: Date
    private weak var _season: Season?
    
    init(title: String, airDate: Date){
        self.title=title
        self.airDate = airDate
      
            
    }
    
    func  addSeason(season: Season) -> Void {
        _season = season
    }
}

extension Episode: CustomStringConvertible{
    var description: String {
       
        if let season = _season{
            return "\(title). Season: \(season.title)"

        }else{
            return "\(title)."
        }
}


}

extension Episode: Equatable{
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return (lhs.title, lhs.airDate) == (rhs.title, rhs.airDate)
    }


}

extension Episode: Hashable{
    var hashValue: Int {
        return description.hashValue
    }

}

extension Episode: Comparable{
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.airDate < rhs.airDate
    }


}
