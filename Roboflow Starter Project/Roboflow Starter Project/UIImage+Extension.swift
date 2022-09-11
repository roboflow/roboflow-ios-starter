//
//  UIImage+Extension.swift
//  Roboflow Starter Project
//
//  Created by Nicholas Arner on 9/11/22.
//

import UIKit

extension UIImage {
 
    /// Rotate the UIImage
    /// - Parameter orientation: Define the rotation orientation
    /// - Returns: Get the rotated image
   func rotateImage(orientation: UIImage.Orientation) -> UIImage {
      guard let cgImage = self.cgImage else { return UIImage() }
      switch orientation {
           case .right:
               return UIImage(cgImage: cgImage, scale: 1.0, orientation: .up)
           case .down:
               return UIImage(cgImage: cgImage, scale: 1.0, orientation: .right)
           case .left:
               return UIImage(cgImage: cgImage, scale: 1.0, orientation: .down)
           default:
               return UIImage(cgImage: cgImage, scale: 1.0, orientation: .left)
       }
   }
}
