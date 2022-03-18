//
//  ViewController.swift
//  FirebaseNotes
//
//  Created by ELLA MADALINSKI on 3/7/22.
//

public struct Person: Codable {
    var name : String
    var age : Int
    var money : Double
    
//    init(n:String, a:Int, m:Double) {
//        name = n
//        age = a
//        money = m
//    }
}


import FirebaseFirestore
import FirebaseFirestoreSwift
import CoreData
import UIKit

class ViewController: UIViewController {
    
    let database = Firestore.firestore()
    var names = [1, 2, 3, 4, 5]
    var names2 : [Int] = []
    var person1 = Person(name: "Ella", age: 15, money: 100.12)
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet weak var ageOutlet: UITextField!
    @IBOutlet weak var moneyOutlet: UITextField!
    @IBOutlet weak var labelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // writing a custom object to Firestore
        let docRef3 = database.document("random/stuff")
        do{
        try docRef3.setData(from: person1)
        }catch {
            print("couldn't write")
        }
        
        
        // this is writing an array to a file
//        let docRef2 = database.document("stuff/people")
//        docRef2.setData(["user": names])
//        names[1] = 7
//        docRef2.updateData(["blah": names])
        
        
        // this is reading data from firebase
//        let docRef = database.document("pony/stable")
//        docRef.getDocument { snapshot, error in
//            guard let data = snapshot?.data(), error == nil
//            else {
//                return
//            }
//
//            guard let text = data["text"] as? String else{
//                return
//            }
//            self.labelOutlet.text = text
//
//            print(data)
//
//        }
//
    }
    
    
    func writeData(text: String){
//        let docRef = database.document("pony/stable")
//        docRef.setData(["text": text])
        let userRef = database.document("user/person")
        userRef.setData(["user": "Ella", "age": 15, "money": 5720.33])
        
        //userRef.updateData(["age": 16])
        
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        
        writeData(text: textFieldOutlet.text!)
    }
    
    @IBAction func readAction(_ sender: UIButton) {
        let docRef = database.document("pony/stable")
        docRef.getDocument { snapshot, error in
            guard let data = snapshot?.data(), error == nil
            else {
                return
            }
            
            guard let text = data["text"] as? String else{
                return
            }
            self.labelOutlet.text = text
            
            print(data)
            
        }
        
    }
    
    
    
    @IBAction func readArrayAction(_ sender: UIButton) {
        let docRef = database.document("stuff/people")
        docRef.getDocument { snapshot, error in
            guard let data = snapshot?.data(), error == nil
            else {
                return
            }
            
            guard let text = data["blah"] as? [Int] else{
                return
            }
            
            //self.labelOutlet.text = text
            self.names2 = text
            //print(text)
            for name in self.names2{
                print(name)
            }
            
        }
    }
    
}

