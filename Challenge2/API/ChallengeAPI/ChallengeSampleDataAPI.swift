//
//  ChallengeSampleDataAPI.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/17.
//

import Foundation

class ChallengeSampleDataAPI {
    
    static let challengeSampleDataAPIShared = ChallengeSampleDataAPI()
    
    func getSampleTeamData() -> TeamTestData {
        var testData = TeamTestData()
        let ramdomNumber = Int.random(in: 1...4)

        switch ramdomNumber {
        case 1:
            testData.upperAgeTestrict = .fifty
            testData.lowerAgeRestrict = .twenty
            testData.genderRestrict = .male
            testData.assistantColor = .red
            testData.autoExitTerm = .fifteen
            testData.lastChallengeTerm = 5
            testData.NumberOfFavorite = 3
            testData.teamWelcome = .premire
        case 2:
            testData.upperAgeTestrict = .no
            testData.lowerAgeRestrict = .twenty
            testData.genderRestrict = .female
            testData.assistantColor = .green
            testData.autoExitTerm = .two
            testData.lastChallengeTerm = 10
            testData.NumberOfFavorite = 8
            testData.teamWelcome = .biginner
        case 3:
            testData.upperAgeTestrict = .no
            testData.lowerAgeRestrict = .no
            testData.genderRestrict = .no
            testData.assistantColor = .no
            testData.autoExitTerm = .four
            testData.lastChallengeTerm = 89
            testData.NumberOfFavorite = 12
            testData.teamWelcome = .full
        case 4:
            break
        default:
            break
        }
        return testData
    }
}

struct TeamTestData {
    var upperAgeTestrict: AgeRestrict = .fourty
    var lowerAgeRestrict: AgeRestrict = .ten
    var genderRestrict: GenderRestrict = .female
    var assistantColor: AssistantColor = .no
    var autoExitTerm: AutoExitTerm = .four
    var lastChallengeTerm = 90
    var NumberOfFavorite = 5
    var teamWelcome: TeamWelcome = .no
}
