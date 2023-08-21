//
//  UIColor + ext.swift
//  TaskList
//
//  Created by Белов Руслан on 17/08/23.
//

import UIKit

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    convenience init(hue: CGFloat, saturation: CGFloat, lightness: CGFloat, alpha: CGFloat) {
           precondition(0...1 ~= hue &&
                        0...1 ~= saturation &&
                        0...1 ~= lightness &&
                        0...1 ~= alpha, "input range is out of range 0...1")

           //From HSL TO HSB ---------
           var newSaturation: CGFloat = 0.0

           let brightness = lightness + saturation * min(lightness, 1-lightness)

           if brightness == 0 { newSaturation = 0.0 }
           else {
               newSaturation = 2 * (1 - lightness / brightness)
           }
           //---------

           self.init(hue: hue, saturation: newSaturation, brightness: brightness, alpha: alpha)
       }
}
