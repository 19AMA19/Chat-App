//
//  Extenstions.swift
//  Chat App
//
//  Created by Abdulkarim Alansari on 06/02/1443 AH.
//
import Foundation
import UIKit

extension UIView{
    
    public var width: CGFloat{
        return self.frame.size.width
    }
    
    public var hight: CGFloat{
        return self.frame.size.height
    }
    
    public var top: CGFloat{
        return self.frame.origin.y
    }
    
    public var buttom: CGFloat{
        return self.frame.size.height + self.frame.origin.y
    }
    
    public var left: CGFloat{
        return self.frame.origin.x
    }
    
    public var right: CGFloat{
        return self.frame.size.width + self.frame.origin.x
    }
    
    
    
}
