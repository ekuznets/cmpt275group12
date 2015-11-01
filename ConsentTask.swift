//
//  ConsentTask.swift
//  logintest
//
//  Created by Evgeny KUZNETSOV on 10/31/15.
//  Copyright (c) 2015 Evgeny KUZNETSOV. All rights reserved.
//

import Foundation
import ResearchKit

public var ConsentTask: ORKOrderedTask
{
    
    var steps = [ORKStep]()
    
    var consentDocument = ConsentDocument
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
    steps += [visualConsentStep]
    
    let signature = consentDocument.signatures!.first as! ORKConsentSignature
    
    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, inDocument: consentDocument)
    
    reviewConsentStep.text = "Review Consent!"
    reviewConsentStep.reasonForConsent = "Consent to join study"
    
    steps += [reviewConsentStep]
    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}