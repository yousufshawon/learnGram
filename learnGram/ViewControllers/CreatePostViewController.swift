//
//  CreatePostViewController.swift
//  learnGram
//
//  Created by Yousuf on 14/7/23.
//

import UIKit

class CreatePostViewController: UIViewController {
    
    static let storyboardId = "CreatePostViewController"
    
    @IBOutlet private var uploadButton : UIButton!
    @IBOutlet private var uploadedImageView : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onUploadImageAction() {
        print("on upload image action")
        showDialogForImageUpload()
    }
    
    private func showDialogForImageUpload(){
        let controller = UIAlertController(title: "Pick option", message: "Please slect image source", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) {_ in
            print("Camera click")
        }
        
        let galleryAction = UIAlertAction(title: "Gallery", style: .default) {_ in
            print("gallery click")
            self.openGallery()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) {_ in
            print("Cancel click")
        }
        
        controller.addAction(cameraAction)
        controller.addAction(galleryAction)
        controller.addAction(cancelAction)
        self.present(controller, animated: true)
    }
    
    private func openGallery() {
        let pickerController = UIImagePickerController()
        pickerController.allowsEditing = true
        pickerController.delegate = self
        self.present(pickerController, animated: true)
    }

}


extension CreatePostViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        self.uploadedImageView.image = image

        /*
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)

        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
         */
        dismiss(animated: true)
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}
