//
//  RegistrationService.swift
//  FirebaseSwiftUIAuth
//
//  Created by Matthew Dolan on 2023-04-17.
//

import Combine
import Foundation
import Firebase
import FirebaseDatabase

// 4.
enum RegistrationKeys: String {
    case firstName
    case lastName
    case occupation
}

// 1.
protocol RegistrationService {
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error>
}

// 2.
final class RegistrationServiceImpl: RegistrationService {
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                
                // 3.
                Auth.auth()
                    .createUser(withEmail: details.email,
                                password: details.password) { res, error in
                        
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            // 5.
                            if let uid = res?.user.uid {
                                let values = [RegistrationKeys.firstName.rawValue: details.firstName,
                                              RegistrationKeys.lastName.rawValue: details.lastName,
                                              RegistrationKeys.occupation.rawValue: details.occupation] as [String : Any]
                                
                                // 6.
                                Database.database()
                                    .reference()
                                    .child("users")
                                    .child(uid)
                                    .updateChildValues(values) { error, ref in
                                        
                                        if let err = error {
                                            promise(.failure(err))
                                        } else {
                                            promise(.success(()))
                                        }
                                    }
                                
                            } else {
                                promise(.failure(NSError(domain: "Invalid User Id", code: 0, userInfo: nil)))
                            }
                            
                        }
                    }
                
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
