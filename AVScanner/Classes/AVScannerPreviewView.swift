//
//  AVScannerPreviewView.swift
//  AVScanner
//
//  Created by mrfour on 16/12/2016.
//

import UIKit
import AVFoundation

public class AVScannerPreviewView: UIView {
    public var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
    public var previewView: AVScannerPreviewView!
    
    public var session: AVCaptureSession? {
        get {
            return videoPreviewLayer.session
        }
        set {
            videoPreviewLayer.session = newValue
        }
    }
    
    // MARK: - UIView
    
    public override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    internal var screenshotImage: UIImage {
        let targetLayer = layer
        
        UIGraphicsBeginImageContextWithOptions(targetLayer.frame.size, true, UIScreen.main.scale)
        
        targetLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image!
    }
}
