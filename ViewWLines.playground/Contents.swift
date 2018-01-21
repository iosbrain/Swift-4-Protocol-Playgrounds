//: A UIKit based Playground for presenting a user interface to test
//: Swift 4 Protocols
//
//  Created by Andrew Jaffee on 01/20/2017.
//
/*
 
 Copyright (c) 2018 Andrew L. Jaffee, microIT Infrastructure, LLC, and
 iosbrain.com.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
 */

import UIKit
import PlaygroundSupport

class LineDrawingView: UIView
{
    override func draw(_ rect: CGRect)
    {
        let currGraphicsContext = UIGraphicsGetCurrentContext()
        currGraphicsContext?.setLineWidth(2.0)
        currGraphicsContext?.setStrokeColor(UIColor.blue.cgColor)
        currGraphicsContext?.move(to: CGPoint(x: 40, y: 400))
        currGraphicsContext?.addLine(to: CGPoint(x: 320, y: 40))
        currGraphicsContext?.strokePath()
        
        currGraphicsContext?.setLineWidth(4.0)
        currGraphicsContext?.setStrokeColor(UIColor.red.cgColor)
        currGraphicsContext?.move(to: CGPoint(x: 40, y: 400))
        currGraphicsContext?.addLine(to: CGPoint(x: 320, y: 60))
        currGraphicsContext?.strokePath()
        
        currGraphicsContext?.setLineWidth(6.0)
        currGraphicsContext?.setStrokeColor(UIColor.green.cgColor)
        currGraphicsContext?.move(to: CGPoint(x: 40, y: 400))
        currGraphicsContext?.addLine(to: CGPoint(x: 250, y: 80))
        currGraphicsContext?.strokePath()
    }
}

class MyViewController : UIViewController
{
    override func loadView()
    {
        let view = LineDrawingView()
        view.backgroundColor = .white

        self.view = view
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
