//: Swift 4 Protocols Playground
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

/*
protocol IsEqualAndComparable
{
    static func == (lhs: Self, rhs: Self) -> Bool

    static func != (lhs: Self, rhs: Self) -> Bool
    
    static func > (lhs: Self, rhs: Self) -> Bool
    
    static func < (lhs: Self, rhs: Self) -> Bool
    
    static func >= (lhs: Self, rhs: Self) -> Bool
    
    static func <= (lhs: Self, rhs: Self) -> Bool

}
*/

protocol IsEqual
{
    static func == (lhs: Self, rhs: Self) -> Bool
    
    static func != (lhs: Self, rhs: Self) -> Bool
}

protocol Comparable
{
    static func > (lhs: Self, rhs: Self) -> Bool
    
    static func < (lhs: Self, rhs: Self) -> Bool
    
    static func >= (lhs: Self, rhs: Self) -> Bool
    
    static func <= (lhs: Self, rhs: Self) -> Bool
}

class StockAtClosing : IsEqual
{
    var symbol:String
    var shares:Int
    var price:Float
    var date:Date
    
    var value:Float
    {
        get
        {
            return Float(shares) * price
        }
    }

    init()
    {
        symbol = "XXXX"
        shares = 0
        price = 0.00
        date = Date()
        date = setClosingDateTime()
    }
    
    init(symbol:String, shares:Int, price:Float)
    {
        self.symbol = symbol
        self.shares = shares
        self.price = price
        self.date = Date()
        self.date = setClosingDateTime()
    }

    static func == (lhs:StockAtClosing, rhs:StockAtClosing) -> Bool
    {
        if ( lhs.symbol == rhs.symbol && lhs.shares == rhs.shares &&
             lhs.price == rhs.price && lhs.date == rhs.date)
        {
            return true
        }
        else
        {
            return false
        }
    }

    static func != (lhs:StockAtClosing, rhs:StockAtClosing) -> Bool
    {
        if ( lhs.symbol != rhs.symbol || lhs.shares != rhs.shares ||
             lhs.price != rhs.price || lhs.date != rhs.date)
        {
            return true
        }
        else
        {
            return false
        }
    }

    func setClosingDateTime() -> Date
    {
        let gregorian = Calendar(identifier: .gregorian)
        let now = Date()
        var components = gregorian.dateComponents([.year, .month, .day, .hour, .minute, .second], from: now)
        
        // Change the time to 4:00:00 PM, stock market close.
        components.hour = 4
        components.minute = 00
        components.second = 0
        
        return gregorian.date(from: components)!
    }

}

let apple = StockAtClosing(symbol: "AAPL", shares: 99, price: 178.46)
let apple1 = StockAtClosing(symbol: "AAPL", shares: 100, price: 178.46)
let ibm = StockAtClosing(symbol: "IBM", shares: 50, price: 135.20)
let ibm1 = StockAtClosing(symbol: "IBM", shares: 50, price: 135.20)

apple == apple1
apple != apple1
ibm == ibm1

class Line : IsEqual, Comparable
{
    var beginPoint:CGPoint
    var endPoint:CGPoint
    
    init()
    {
        beginPoint = CGPoint(x: 0, y: 0);
        endPoint = CGPoint(x: 0, y: 0);
    }

    init(beginPoint:CGPoint, endPoint:CGPoint)
    {
        self.beginPoint = CGPoint( x: beginPoint.x, y: beginPoint.y )
        self.endPoint = CGPoint( x: endPoint.x, y: endPoint.y )
    }
    
    // The line length formula is based on the Pythagorean Theorem.
    func length () -> CGFloat
    {
        let length = sqrt( pow(endPoint.x - beginPoint.x, 2) + pow(endPoint.y - beginPoint.y, 2) )
        return length
    }

    static func == (leftHandSideLine: Line, rightHandSideLine: Line) -> Bool
    {
        return (leftHandSideLine.length() == rightHandSideLine.length())
    }

    static func != (leftHandSideLine: Line, rightHandSideLine: Line) -> Bool
    {
        return (leftHandSideLine.length() != rightHandSideLine.length())
    }
    
    static func > (leftHandSideLine: Line, rightHandSideLine: Line) -> Bool
    {
        return (leftHandSideLine.length() > rightHandSideLine.length())
    }
    
    static func < (leftHandSideLine: Line, rightHandSideLine: Line) -> Bool
    {
        return (leftHandSideLine.length() < rightHandSideLine.length())
    }
    
    static func >= (leftHandSideLine: Line, rightHandSideLine: Line) -> Bool
    {
        return (leftHandSideLine.length() >= rightHandSideLine.length())
    }
    
    static func <= (leftHandSideLine: Line, rightHandSideLine: Line) -> Bool
    {
        return (leftHandSideLine.length() <= rightHandSideLine.length())
    }

} // end class Line : IsEqual, Comparable

let x1 = CGPoint(x: 0, y: 0)
let y1 = CGPoint(x: 2, y: 2)
let line1 = Line(beginPoint: x1, endPoint: y1)
line1.length()
// returns 2.82842712474619

let x2 = CGPoint(x: 3, y: 2)
let y2 = CGPoint(x: 5, y: 4)
let line2 = Line(beginPoint: x2, endPoint: y2)
line2.length()
// returns 2.82842712474619

line1 == line2
// returns true
line1 != line2
// returns false
line1 > line2
// returns false
line1 <= line2
// returns true

let xxBlue = CGPoint(x: 40, y: 400)
let yyBlue = CGPoint(x: 320, y: 40)
let lineBlue = Line(beginPoint: xxBlue, endPoint: yyBlue)

let xxRed = CGPoint(x: 40, y: 400)
let yyRed = CGPoint(x: 320, y: 60)
let lineRed = Line(beginPoint: xxRed, endPoint: yyRed)
lineRed.length()
// returns 440.454310910905

lineBlue != lineRed
// returns true
lineBlue > lineRed
// returns true
lineBlue >= lineRed
// returns true

let xxGreen = CGPoint(x: 40, y: 400)
let yyGreen = CGPoint(x: 250, y: 80)
let lineGreen = Line(beginPoint: xxGreen, endPoint: yyGreen)
lineGreen.length()
// returns 382.753184180093
lineGreen < lineBlue
// returns true
lineGreen <= lineRed
// returns true
lineGreen > lineBlue
// returns false
lineGreen >= lineBlue
// returns false
lineGreen == lineGreen
// returns true
