//
//  ImageUtils.swift
//  EventsApp
//
//  Created by Asif Ashadullah on 2025-03-16.
//

import PhotosUI

struct ImageUtils {
    static func decodeBase64ToImage(base64String: String) -> UIImage? {
        guard let imageData = Data(base64Encoded: base64String) else { return nil }
        
        return UIImage(data: imageData)
    }
}
