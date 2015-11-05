////
////  SurveyTask.swift
////  logintest
////
////  Created by Evgeny KUZNETSOV on 10/31/15.
////  Copyright (c) 2015 Evgeny KUZNETSOV. All rights reserved.
////
//
import Foundation
import ResearchKit

public var SurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "We are going to ask question if you sick or not"
    instructionStep.text = "WTF"
    steps += [instructionStep]
    
    let questQuestionStepTitle = "Are you sick?"
    let textChoices =
    [
        ORKTextChoice(text: "Yes", value: 0),
        ORKTextChoice(text: "No", value: 1),
    ]
    
    let questAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices)
    let questQuestionStep = ORKQuestionStep(identifier: "TextChoiceQuestionStep", title: questQuestionStepTitle, answer: questAnswerFormat)
    steps += [questQuestionStep]
    
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Thank you for your report"
    summaryStep.text = "Every person counts"
    steps += [summaryStep]
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}