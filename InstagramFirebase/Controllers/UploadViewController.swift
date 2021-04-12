//
//  UploadViewController.swift
//  InstagramFirebase
//
//  Created by MD Tanvir Alam on 8/4/21.
//

import UIKit
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    //MARK:- Outlets
    @IBOutlet weak var uploadBTN: UIButton!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK:- LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        imageAddGesture()
    }
    
    //MARK:- Actions
    @IBAction func uploadBTNClicked(_ sender: UIButton) {
        uploadImageToStorage()
    }
    
    //MARK:- Functions
    func uploadImageToStorage(){
        let storage = Storage.storage()
        let storageReferance = storage.reference()
        let mediaFolder = storageReferance.child("Media")
        let uuidString = UUID().uuidString
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            let imageReference = mediaFolder.child("\(uuidString).jpg")
            imageReference.putData(data, metadata: nil) { (metaData, error) in
                if let error = error{
                    self.showAlert(title: "Alert", message: error.localizedDescription)
                }else{
                    imageReference.downloadURL { (url, error) in
                        if error == nil, let imageUrl = url{
                            print(imageUrl)
                            
                            //put url to database
                            let firestoreDatabase = Firestore.firestore()
                            var firestoreReference : DocumentReference? = nil
                            
                            
                            let firestorePost = ["imageUrl":imageUrl.absoluteString,"postedBy":Auth.auth().currentUser!.email!,"postComment":self.commentText.text ?? "No comment","date":FieldValue.serverTimestamp(),"likes":0] as [String : Any]
                            
                            firestoreReference = firestoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: { (error) in
                                if let error = error{
                                    self.showAlert(title: "Error", message:error.localizedDescription)
                                }else{
                                    self.imageView.image = UIImage(named:"select")
                                    self.tabBarController?.selectedIndex = 0
                                    self.commentText.text = ""
                                    self.showAlert(title: "Success", message: "Success Saving Post")
                                }
                            })
                            
                            //self.showAlert(title: "Success", message: "Success uploading image")
                        }
                    }
                }
            }
        }
    }
    func imageAddGesture(){
        imageView.isUserInteractionEnabled = true
        let gestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecogniser)
    }
    func showAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle:.alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func chooseImage(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        present(pickerController, animated: true, completion: nil)
    }
    
    //MARK:- Delegate Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
}
