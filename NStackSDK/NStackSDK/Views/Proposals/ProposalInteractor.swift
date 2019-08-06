//
//  ProposalInteractor.swift
//  NStackSDK
//
//  Created by Nicolai Harbo on 06/08/2019.
//  Copyright © 2019 Nodes ApS. All rights reserved.
//

import Foundation

class ProposalInteractor {
    // MARK: - Properties
    weak var output: ProposalInteractorOutput?
    private let nstack: NStack?
    
    // MARK: - Init
    init(nstack: NStack) {
        self.nstack = nstack
    }
}

// MARK: - Business Logic -

// PRESENTER -> INTERACTOR
extension ProposalInteractor: ProposalInteractorInput {
    func perform(_ request: Proposals.Request.DeleteProposal) {
        nstack?.deleteProposal(request.proposal, completion: { (result) in
            switch result {
            case .success(let success):
                break
            case .failure(let error):
                break
            }
        })
    }
    
}
