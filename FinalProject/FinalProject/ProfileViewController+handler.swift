//
//  ProfileViewController+handler.swift
//  FinalProject
//
//  Created by Kranthi Chinnakotla on 11/3/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

extension ProfileViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func pickAnImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImag: UIImage?
        
        if let originalImage = info["UIImagePickerControllerOriginalImage"]{
            
            selectedImag = (originalImage as! UIImage)
            
        }else if let editImage = info["UIImagePickerControllerEditedImage"]{
            selectedImag = (editImage as! UIImage)
        }
        
        if let image = selectedImag {
            profileImage.image = image
            
            
            //.child("userImages.png")
            
            
            
            
            
        }
        
        
        dismiss(animated: true, completion: nil)
        

        
    }
            
    @nonobjc func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("Canceleld picker")
      //  dismiss(animated: true, completion: nil)
    }

    
}
