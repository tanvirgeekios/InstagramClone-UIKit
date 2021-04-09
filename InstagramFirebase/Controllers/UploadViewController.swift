//
//  UploadViewController.swift
//  InstagramFirebase
//
//  Created by MD Tanvir Alam on 8/4/21.
//

import UIKit

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
    }
    
    //MARK:- Functions
    func imageAddGesture(){
        imageView.isUserInteractionEnabled = true
        let gestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecogniser)
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
