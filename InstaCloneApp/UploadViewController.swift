//
//  UploadViewController.swift
//  InstaCloneApp
//
//  Created by Yusuf Sinan Ulukanligil on 2020-08-15.
//  Copyright © 2020 Yusuf Sinan Ulukanligil. All rights reserved.
//

import UIKit
import Firebase

class UploadViewController: ViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet var uploadImage: UIImageView!
    @IBOutlet var uploadComment: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uploadImage.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        uploadImage.addGestureRecognizer(gestureRecognizer)
    }
    @objc func chooseImage() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController,animated: true,completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        uploadImage.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func uploadClicked(_ sender: Any) {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("Media")
        
        if let data = uploadImage.image?.jpegData(compressionQuality: 0.5) {
            let uuid = UUID().uuidString
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(data, metadata: nil) { (metadata, error) in
                 if error != nil {
                                   print(error!.localizedDescription)
                               } else {
                                   imageReference.downloadURL { (Url, error) in
                                       if error == nil {
                                           self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Fatal Error")
                                           let imageUrl = Url?.absoluteString
                                           print(imageUrl)
                                         //Database
                                           let fireStoreDatabase = Firestore.firestore()
                                           
                                           var fireStoreReference:DocumentReference? = nil
                                      
                                           let fireStonePost = ["imageURl":imageUrl!,"postedBy":Auth.auth().currentUser!.email,"postComment":self.uploadComment.text!,"date": FieldValue.serverTimestamp(),"likes":0] as [String:Any]
                                           
                                           fireStoreReference = fireStoreDatabase.collection("Post").addDocument(data: fireStonePost, completion: { (error) in
                                               if error != nil {
                                                   self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Fatal Error")
                                               } else {
                                                   self.uploadImage.image = UIImage(named: "select.png")
                                                   self.uploadComment.text = ""
                                                   self.tabBarController?.selectedIndex = 0
                                               }
                                           })
            }
               
                            
                                }
                            }
                            }
                        }
                    }
                }
            
        
        
    
    
    



