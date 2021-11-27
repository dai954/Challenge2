//
//  TeamCreateSections.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/26.
//

import Foundation
import RxDataSources

typealias AnimatedTeamCreateSection = AnimatableSectionModel<SectionID, TeamCreateSectionItem>

enum TeamCreateSectionItem: String, IdentifiableType, Equatable  {
    
    case teamCreateImage
    case teamCreateHeaderImage
    case teamCreateCategory
    case teamCreateNmae
    case teamCreatePremium
    case teamCreateBeginner
    case teamCreateChallenge
    case teamCreateDescription
    
    case teamCreateOptionTop
    case teamCreateMemberOption
    case teamCreateAgeOption
    case teamCreateGenderOption
    case teamCreateExitTermOption
    case teamCreateAssistantOption
    
    case teamCreateButton
    
    var identity: String {
        return self.rawValue
    }
    
    static func == (lhs: TeamCreateSectionItem, rhs: TeamCreateSectionItem) -> Bool {
        return lhs.identity == rhs.identity
    }
}

enum SectionID: String, IdentifiableType {
    case section1
    case section2
    case section3

    var identity: String {
        return self.rawValue
    }
}
