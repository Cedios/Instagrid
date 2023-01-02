//
//  ViewController.swift
//  Instagrid
//
//  Created by Cédrik Razafimanantsoa on 22/11/2022.
//

import UIKit



class ViewController: UIViewController {
    // Buttons in the main view with four images
    @IBOutlet private weak var topLeftButton: UIButton!
    @IBOutlet private weak var bottomLeftButton: UIButton!
    @IBOutlet private weak var topRightButton: UIButton!
    @IBOutlet private weak var bottomRightButton: UIButton!
    @IBOutlet private weak var swipeLabel: UILabel!

    // Buttons to select the image display
    @IBOutlet private weak var layoutUpLargeButton: UIButton!
    @IBOutlet private weak var layoutDownLargeButton: UIButton!
    @IBOutlet private weak var layoutFourButton: UIButton!
    
    private var selectedButton: UIButton?
    
    // Blue frame containing the four images display
    @IBOutlet private weak var blueFrame: UIView!
    
    private var imagePickerController: UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        return imagePickerController
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        blueFrame.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        blueFrame.layer.shadowOffset = CGSize(width: 6, height: 6)
        blueFrame.layer.shadowOpacity = 1
        blueFrame.layer.shadowRadius = 2
        blueFrame.layer.masksToBounds = false
        blueFrame.layer.cornerRadius = 4
    }
    
    // MARK: - Layout Management
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if UIDevice.current.orientation.isLandscape {
            swipeLabel.text = " Swipe left to share"
        }
        else {
            swipeLabel.text = " Swipe up to share"
        }
    }
    
    // Functions to hide the proper Blue frame button to reproduce the image display
    @IBAction private func layoutUpLargeTouchUpInside() {
        topLeftButton.isHidden = true
        bottomLeftButton.isHidden = false
        layoutUpLargeButton.setImage(UIImage(named: "Selected"), for: .normal)
        layoutDownLargeButton.setImage(nil, for: .normal)
        layoutFourButton.setImage(nil, for: .normal)
    }
    
    @IBAction private func layoutDownLargeTouchUpInside() {
        topLeftButton.isHidden = false
        bottomLeftButton.isHidden = true
        layoutUpLargeButton.setImage(nil, for: .normal)
        layoutDownLargeButton.setImage(UIImage(named: "Selected"), for: .normal)
        layoutFourButton.setImage(nil, for: .normal)
    }
    
    @IBAction private func layoutFourTouchUpInside() {
        topLeftButton.isHidden = false
        bottomLeftButton.isHidden = false
        layoutUpLargeButton.setImage(nil, for: .normal)
        layoutDownLargeButton.setImage(nil, for: .normal)
        layoutFourButton.setImage(UIImage(named: "Selected"), for: .normal)
    }
    
    // MARK: - Image Selection
    // Functions to select an image when tapping one of the Blue frame buttons
    @IBAction private func topLeftTouchUpInside() {
        selectedButton = topLeftButton
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction private func topRightTouchUpInside() {
        selectedButton = topRightButton
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction private func bottomLeftTouchUpInside() {
        selectedButton = bottomLeftButton
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction private func bottomRightTouchUpInside() {
        selectedButton = bottomRightButton
        present(imagePickerController, animated: true, completion: nil)
    }
    
    //Pick image and display Uipickerviewcontroler and UiActivitycontroler
    @IBAction private func swipToShare(_ sender: UISwipeGestureRecognizer) {
        let image = blueFrame.toImage()
        let swipeController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(swipeController, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectedButton?.setImage(selectedImage, for: .normal)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
}

extension UIView {
    func toImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
        let image = renderer.image { ctx in
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
        return image
    }
}

