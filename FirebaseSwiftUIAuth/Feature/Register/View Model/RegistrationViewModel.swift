//
//  RegistrationViewModel.swift
//  FirebaseSwiftUIAuth
//
//  Created by Matthew Dolan on 2023-04-17.
//

import Combine
import Foundation

// 1.
enum RegistrationState {
    case successful
    case failed(error: Error)
    case na
}

// 2.
protocol RegistrationViewModel {
    func register()
    var service: RegistrationService { get }
    var state: RegistrationState { get }
    var userDetails: RegistrationDetails { get }
    
    init(service: RegistrationService)
}

// 3.
final class RegistrationViewModelImpl: ObservableObject, RegistrationViewModel {
    let service: RegistrationService
    var state: RegistrationState = .na
    // 4. Created computed property inside RegistrationDetails
    @Published var userDetails: RegistrationDetails = RegistrationDetails.new
    
    // 5.
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: RegistrationService) {
        self.service = service
    }
    
    // 5.
    func register() {
        service
            .register(with: userDetails)
            .sink { [weak self] res in
                switch res {
                    case .failure(let error):
                        self?.state = .failed(error: error)
                    default: break
                }
            } receiveValue: { [weak self] in
                self?.state = .successful
            }
            .store(in: &subscriptions)
        
    }
}
