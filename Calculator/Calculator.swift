//
//  Calculator.swift
//  StudentTaskManager
//
//  Created by Rishabh Alexander John on 15/6/22.
//

import SwiftUI

enum CalcButton:String
{
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case multiply = "x"
    case divide = "/"
    case subtract = "-"
    case clear = "AC"
    case percentage = "%"
    case equal = "="
    case decimal = "."
    case negative = "+/-"
    
    var buttonColor:Color
    {
        switch self
        {
            case .add,.subtract,.multiply,.divide,.equal :
            return .orange
            
        case .clear, .negative,.percentage:
            return Color(.lightGray)
            
        default:
            return Color(UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1))
        }
    }
    
}

enum Operation
{
    case add,subtract,multiply,divide,none
    
}

struct Calculator: View {
    
    
    let buttons : [[CalcButton]] = [
        [.clear, .negative, .percentage,.divide],
        [.seven, .eight, .nine,.multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
        
    ]
    
    @State var runningNumber = 0.0
    
    @State var currentOperation: Operation = .none
    
    @State var value = "0"
    var body: some View {
        
        ZStack
        {
            Color.black
                .ignoresSafeArea()
            
            VStack
            {
                Spacer()
                
                //Text Display
                HStack
                {
                    Spacer()
                    
                    Text(value.count>5 ? self.limiter(longstring: self.value):self.value)
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size:90))
                }.padding()
                
                //Buttons
                
                ForEach(buttons, id: \.self){row in
                    
                    HStack(spacing:12)
                    {
                        
                        ForEach(row, id: \.self){item in
                            
                            Button {
                                
                                self.didTap(button: item)
                                
                            } label: {
                                
                                Text(item.rawValue)
                                    .frame(width: self.ButtonWidth(item: item), height:self.ButtonHeight())
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.ButtonWidth(item: item)/2)
                                    .font(.system(size:32))
                            }

                            
                        }
                        
                    }.padding(.bottom,3)
                }
            }
        }
        
    }
    
    func didTap( button: CalcButton)
    {
        switch button{
        case .add, .multiply, .divide, .subtract,.equal:
            
            if button == .add
            {
                self.currentOperation = .add
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .subtract
            {
                self.currentOperation = .subtract
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .multiply
            {
                self.currentOperation = .multiply
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .divide
            {
                self.currentOperation = .divide
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .equal
            {
                let runningValue = self.runningNumber
                let currentValue = Double(self.value) ?? 0
                
                switch self.currentOperation
                {
                case .add:
                    self.value = "\(runningValue + Double(currentValue))"
                    if value.last == "0"
                    {
                        self.value = "\(Int(runningValue + Double(currentValue)))"
                    }
                    
                case .subtract:
                    self.value = "\(runningValue - Double(currentValue))"
                    if value.last == "0"
                    {
                        self.value = "\(Int(runningValue - Double(currentValue)))"
                    }
                    
                case .divide:
                    self.value = "\(runningValue / Double(currentValue))"
                    if value.last == "0"
                    {
                        self.value = "\(Int(runningValue / Double(currentValue)))"
                    }
                    
                case .multiply:
                    self.value = "\(runningValue * Double(currentValue))"
                    if value.last == "0"
                    {
                        self.value = "\(Int(runningValue * Double(currentValue)))"
                    }
                    
                case .none: break
                }
                
                
                
            }
            
            if button != .equal
            {
                self.value = ""
            }
            
            
        case .clear:
            self.value = "0"
            self.runningNumber = 0.0
            break
            
            
        case .percentage:
            self.value = "\((Double(self.value) ?? 0.0) * 0.01)"
            break
            
        case .negative:
            self.value = "\(0 - (Double(self.value) ?? 0.0))"
            if value.last == "0"
            {
                let holder = Double(self.value) ?? 0.0
                
                self.value = "\(Int(holder))"
            }
            break
            
        case .decimal:
            
            self.value = "\(self.value)."
            
            break
            
        default:
            let number = button.rawValue
            if(self.value == "0")
            {
                value = number
            }
            else
            {
                self.value = "\(self.value)\(number)"
            }
            
        }
    }
    
    
    func ButtonWidth (item: CalcButton) -> CGFloat
    {
        if( item == .zero)
        {
            return ((UIScreen.main.bounds.width - (4*12))/4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12))/4
    }
    
    func ButtonHeight() -> CGFloat
    {
        return (UIScreen.main.bounds.width - (5*12))/4
    }
    
    func limiter(longstring: String)->String
    {
        var holder = String(longstring.prefix(5))
        holder.append("..")
        return holder
    }
   
}

struct Calculator_Previews: PreviewProvider{
    static var previews: some View{
        Calculator()
    }
}
