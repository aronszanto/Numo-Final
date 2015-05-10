//
//  ContactIntegrationController.swift
//  Numo
//
//  Created by Numo on 12/3/14.
//  Copyright (c) 2014 Numo LLC. All rights reserved.
//

import Foundation
import UIKit
import AddressBook
import AddressBookUI

class ContactIntegrationController: UIViewController {
    
    var window: UIWindow?
    var addressBook: ABAddressBookRef?
    
    func createAddressBook(){
        var error: Unmanaged<CFError>?
        
        addressBook = ABAddressBookCreateWithOptions(nil,
            &error).takeRetainedValue()
        
        /* You can use the address book here */
        
    }
    
    // deal with address book permissions
    func application(application: UIApplication!,
        didFinishLaunchingWithOptions launchOptions:
        [NSObject : AnyObject]?) -> Bool {
            
            switch ABAddressBookGetAuthorizationStatus(){
            case .Authorized:
                println("Already authorized")
                createAddressBook()
                /* Now address book can be used */
            case .Denied:
                println("You are denied access to address book")
                
            case .NotDetermined:
                createAddressBook()
                if let theBook: ABAddressBookRef = addressBook{
                    ABAddressBookRequestAccessWithCompletion(theBook,
                        {(granted: Bool, error: CFError!) in
                            
                            if granted{
                                println("Access is granted")
                            } else {
                                println("Access is not granted")
                            }
                            
                    })
                }
                
            case .Restricted:
                println("Access is restricted")
                
            default:
                println("Unhandled")
            }
            
            return true
    }
    
    
    // add contact to address book from app
    // missing number and address complexity
    func newPersonWithFirstName(firstName: String,
        lastName: String, /* emailAddress: String, phoneNumber: String, */
        inAddressBook: ABAddressBookRef) -> ABRecordRef?{
            
            let person: ABRecordRef = ABPersonCreate().takeRetainedValue()
            
            let couldSetFirstName = ABRecordSetValue(person,
                kABPersonFirstNameProperty,
                firstName as CFTypeRef,
                nil)
            
            let couldSetLastName = ABRecordSetValue(person,
                kABPersonLastNameProperty,
                lastName as CFTypeRef,
                nil)
            
            var error: Unmanaged<CFErrorRef>? = nil
            
            let couldAddPerson = ABAddressBookAddRecord(inAddressBook, person, &error)
            
            if couldAddPerson{
                println("Successfully added the person.")
            } else {
                println("Failed to add the person.")
                return nil
            }
            
            if ABAddressBookHasUnsavedChanges(inAddressBook){
                
                var error: Unmanaged<CFErrorRef>? = nil
                let couldSaveAddressBook = ABAddressBookSave(inAddressBook, &error)
                
                if couldSaveAddressBook{
                    println("Successfully saved the address book.")
                } else {
                    println("Failed to save the address book.")
                }
            }
            
            if couldSetFirstName && couldSetLastName{
                println("Successfully set the first name " +
                    "and the last name of the person")
            } else {
                println("Failed to set the first name and/or " +
                    "the last name of the person")
            }
            return person
    }
}




