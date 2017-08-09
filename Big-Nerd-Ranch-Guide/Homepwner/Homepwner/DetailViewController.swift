//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Radio Shaolin on 07.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    // MARK: - Properties
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    var imageStore: ImageStore!
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    // MARK: - Outlets
    @IBOutlet var nameField: DetailTextField!
    @IBOutlet var serialNumberField: DetailTextField!
    @IBOutlet var valueField: DetailTextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var trashPictureButton: UIBarButtonItem!
    
    // MARK: - Actions
    @IBAction func removePicture(_ sender: UIBarButtonItem) {
        
        imageStore.deleteImage(forKey: item.itemKey)
        imageView.image = nil
        trashPictureButton.isEnabled = false
    }

    @IBAction func takePicture(_ sender: UIBarButtonItem) {

        let imagePicker = UIImagePickerController()

        // If the device has a camera, take a picture; otherwise,
        // just pick from photo library
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            
            let overlayView = UIView(frame: imagePicker.cameraOverlayView!.frame)
            
            let crosshairLabel = UILabel()
            crosshairLabel.text = "+"
            crosshairLabel.font = UIFont.systemFont(ofSize: 50)
            crosshairLabel.textColor = UIColor(white: 1, alpha: 0.5)
            crosshairLabel.translatesAutoresizingMaskIntoConstraints = false
            overlayView.addSubview(crosshairLabel)
            
            crosshairLabel.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor).isActive = true
            crosshairLabel.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor).isActive = true
            
            // To avoid blocking the underneath default camera controls
            overlayView.isUserInteractionEnabled = false
            
            imagePicker.cameraOverlayView = overlayView
            
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.allowsEditing = true
        imagePicker.delegate = self

        // Place image picker on the screen
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    // MARK: - View life cycle
    override func viewDidLoad() {
        valueField.keyboardType = .numberPad
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
        
        // Get the item key
        let key = item.itemKey
        
        // If there is an associated image with the item
        // display it on the image view
        let imageToDisplay = imageStore.image(forKey: key)
        imageView.image = imageToDisplay
        
        if imageStore.image(forKey: item.itemKey) == nil {
            trashPictureButton.isEnabled = false
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Clear first responder
        view.endEditing(true)
        
        // "Save" changes to item
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberField.text
        
        if let valueText = valueField.text, let value = numberFormatter.number(from: valueText) {
            item.valueInDollars = value.intValue
        } else {
            item.valueInDollars = 0
        }
    }
    
    // MARK: - Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                                 didFinishPickingMediaWithInfo info: [String: Any]) {
        
        // Get picked image from info dictionary
//        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Store the image in the ImageStore for the item's key
        imageStore.setImage(image, forKey: item.itemKey)
        
        // Put that image on the screen in the image view
        imageView.image = image
        trashPictureButton.isEnabled = true
        
        // Take image picker off the screen -
        // you must call this dismiss method
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Seques
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "changeDate"?:
            let dateCreatedViewController = segue.destination as! DateCreatedViewController
            dateCreatedViewController.item = item
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
}
    
    

