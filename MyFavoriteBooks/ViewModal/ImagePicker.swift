//
//  ImagePicker.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/30/24.
//

import SwiftUI
import PhotosUI
// new import!
// PhotosUI framework that provides access to your photos

struct ImagePicker: UIViewControllerRepresentable {
    // UIViewControllerRepresentable = (missed it)
    
    @Binding var image: Image?
    
    
    // creates and returns a coordinator instance to manage PHPickerViewControllerDelegate methods
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // configures and returns the phpicker+v+c with image filter applied
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        // the filter is applying image processing operations
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    // updates the phpicker+v+c. this is empty because theres no need to update the view controller
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
            
    }
    
    // coordinator class to handle \/ methods
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        // PHPickerViewController = allows users to select images from the library
        
        // PHPickerViewControllerDelegate metod that is called when the user finished picking an image
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            // dismisses the picker view
            picker.dismiss(animated: true)
            
            guard let provider = results.first?.itemProvider else { return }
            
            // checks if the itemProvider can load an UIImage
            if provider.canLoadObject(ofClass: UIImage.self) {
                
                // loads the image
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    
                    // ensures the image loading is done
                    DispatchQueue.main.async {
                        if let uIImage = image as? UIImage {
                            self.parent.image = Image(uiImage: uIImage)
                        }
                    }
                }
            }
        }
    }
}
