//
//  AddArtViewController.swift
//  ArtCisco7.0
//
//  Created by Jake Ols on 12/18/16.
//  Copyright © 2016 Oskar/Jake. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class AddArtViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var addLocationButton: UIButton!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    @IBOutlet weak var shareButton: UIButton!
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        //setup
        imagePicker.delegate = self

    }
    @IBAction func addingLocation(_ sender: Any) {
        self.performSegue(withIdentifier: "addLocationSegue", sender: self)
    }
    
    @IBAction func addPhotoAction(_ sender: Any) {
        //add photo action
        
        let alertController = UIAlertController(title: nil, message: "Would you like to upload an image from your library, or open the camera?", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let libraryAction = UIAlertAction(title: "Library", style: .default) { action in
            // ...
            self.selectPicture()
            
        }
        alertController.addAction(libraryAction)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in

        }
        alertController.addAction(cameraAction)
        
        self.present(alertController, animated: true) {
            // ...
        }

        
    }
    @IBAction func addLocationAction(_ sender: Any) {
        //add location
        
    }
    
    @IBAction func shareAction(_ sender: Any) {
        
    
        
        
    }
    
    //open camera roll for selection
    func selectPicture() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {

        
        // Get local file URLs
        guard let image: UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        let imageData = UIImagePNGRepresentation(image)!
        guard let imageURL: NSURL = info[UIImagePickerControllerReferenceURL] as? NSURL else { return }
        
        // Get a reference to the location where we'll store our photos
        let storage = FIRStorage.storage()
        let photosRef = storage.reference(forURL: "gs://artcisco-f9157.appspot.com").child("art_photos")
        
        // Get a reference to store the file at chat_photos/<FILENAME>
        let photoRef = photosRef.child("\(NSUUID().uuidString).png")
        // Upload file to Firebase Storage
        let metadata = FIRStorageMetadata()
        metadata.contentType = "image/png"
        photoRef.put(imageData, metadata: metadata).observe(.success) { (snapshot) in
            // When the image has successfully uploaded, we get it's download URL
            let text = snapshot.metadata?.downloadURL()?.absoluteString
            // Set the download URL to the message box, so that the user can send it to the database
            print(text!)
        }
        }
        
        // Clean up picker
        dismiss(animated: true, completion: nil)
    }
}
