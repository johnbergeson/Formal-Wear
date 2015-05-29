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
  
  
  @IBOutlet var nameField: UITextField!
  
  @IBOutlet var storeField: UITextField!
    
  @IBOutlet var priceField: UITextField!
  
  
  override func viewDidLoad() {
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
        
  @IBAction func saveButtonHit(sender: UIButton) {
    
    var name = self.nameField.text
    var store = self.storeField.text
    var image = UIImageJPEGRepresentation(photoImageView.image, 0.8)
    var price : Double = (self.priceField.text as NSString).doubleValue
    var dress = Dress(name: name, price: price, store: store, imageData: image)
    dress.saveToServer()
    self.performSegueWithIdentifier("listViewController", sender: self)
  }

}

