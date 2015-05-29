//
//  AddDressViewController.swift
//  
//
//  Created by Jason Scharff on 5/28/15.
//
//

import Foundation
import UIKit
class AddDressViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    var photoImageView = UIImageView(frame: CGRectMake(40, 120, 200, 200))
    
  override func viewDidLoad() {
    self.view.backgroundColor = UIColor.whiteColor()
    self.view.addSubview(photoImageView)
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        self.view.addSubview(photoImageView)
    }
    @IBAction func openPhotoLibrary(sender: AnyObject)
    {
        var photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .PhotoLibrary
        self.presentViewController(photoPicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    {
        photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismissViewControllerAnimated(false, completion: nil)
    }
        

}

