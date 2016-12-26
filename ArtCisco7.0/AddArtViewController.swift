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
    var imageUrl = NSURL(string: "")
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var addLocationButton: UIButton!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    @IBOutlet weak var shareButton: UIButton!
    override func viewDidLoad() {
        //setup
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
        
        //share
        
//        print(self.imageUrl!)
//        //Firebase storage Ref
//        let storage = FIRStorage.storage()
//        let storageRef = storage.reference(forURL: "artcisco-f9157.appspot.com")
//        let imagesRef = storageRef.child("images")
//        
//        
//        //upload
//        let uploadTask = imagesRef.putFile(self.imageUrl as! URL!, metadata: nil) { metadata, error in
//            if let error = error {
//                // Uh-oh, an error occurred!
//            } else {
//                // Metadata contains file metadata such as size, content-type, and download URL.
//                let downloadURL = metadata!.downloadURL()
//            }
//        }
        
        
    }
    
    //open camera roll for selection
    func selectPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        self.imageUrl         = info[UIImagePickerControllerReferenceURL] as? NSURL
        let imageName         = imageUrl?.lastPathComponent
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let photoURL          = NSURL(fileURLWithPath: documentDirectory)
        let localPath         = photoURL.appendingPathComponent(imageName!)
        let image             = info[UIImagePickerControllerOriginalImage]as! UIImage
        let data              = UIImagePNGRepresentation(image)
        
        do
        {
            try data?.write(to: localPath!, options: Data.WritingOptions.atomic)
        }
        catch
        {
            // Catch exception here and act accordingly
        }
        
        self.dismiss(animated: true, completion: nil);
    }
}
