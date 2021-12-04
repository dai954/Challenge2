//
//  TeamCreateSections.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/26.
//

import Foundation
import RxDataSources

typealias AnimatedTeamCreateSection = AnimatableSectionModel<SectionID, TeamCreateSectionItem>

enum TeamCreateSectionItem: IdentifiableType, Equatable  {
    
    case teamCreateImage(viewModel: TeamCreateImageCellViewModel)
    case teamCreateCategory(viewModel: TeamCreateCategoryCellViewModel)
    case teamCreateNmae(viewModel: TeamCreateNameCellViewModel)
    case teamCreateHeaderImage(viewModel: TeamCreateHeaderImageCellViewModel)
    case teamCreatePremium(viewModel: TeamCreatePremiumCellViewModel)
    case teamCreateBeginner(viewModel: TeamCreateBeginnerCellViewModel)
    case teamCreateChallenge(viewModel: TeamCreateChallengeTermCellViewModel)
    case teamCreateDescription(viewModel: TeamCreateDescriptionCellViewModel)
    
    case teamCreateOptionTop(viewModel: TeamCreateOptionTopCellViewModel)
    case teamCreateMemberOption(viewModel: TeamCreateOptionCellViewModel)
    case teamCreateAgeOption(viewModel: TeamCreateOptionCellViewModel)
    case teamCreateGenderOption(viewModel: TeamCreateOptionCellViewModel)
    case teamCreateExitTermOption(viewModel: TeamCreateOptionCellViewModel)
    case teamCreateAssistantOption(viewModel: TeamCreateOptionBottomCellViewModel)
    
    case teamCreateButton(viewModel: TeamCreateOptionBottomCellViewModel)
    
    var stringValue: String {
        switch self {
        case .teamCreateImage(let viewModel): return viewModel.id
        case .teamCreateCategory(let viewModel): return viewModel.id
        case .teamCreateNmae(let viewModel): return viewModel.id
        case .teamCreateHeaderImage(let viewModel): return viewModel.id
        case .teamCreatePremium(let viewModel): return viewModel.id
        case .teamCreateBeginner(let viewModel): return viewModel.id
        case .teamCreateChallenge(let viewModel): return viewModel.id
        case .teamCreateDescription(let viewModel): return viewModel.id
        case .teamCreateOptionTop(let viewModel): return viewModel.id
        case .teamCreateMemberOption(let viewModel): return viewModel.id
        case .teamCreateAgeOption(let viewModel): return viewModel.id
        case .teamCreateGenderOption(let viewModel): return viewModel.id
        case .teamCreateExitTermOption(let viewModel): return viewModel.id
        case .teamCreateAssistantOption(let viewModel): return viewModel.id
        case .teamCreateButton(let viewModel): return viewModel.id
        }
    }
    
    var identity: String {
        return self.stringValue
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
