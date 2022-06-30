//
//  ContentView.swift
//  Calculator
//
//  Created by RJ on 24/02/22.


import SwiftUI

struct ContentView: View {
    
    @State var minus = false
    @State var fordot = ""
    @State var input = "0"
    @State var update = "0"
    @State var operation = ""
    
    func operate(){
        switch operation {
            
        case "+":
            
            if input.contains(".") || update.contains("."){
            let ans = Float(input)! + Float(update)!
            input = String(ans)
            }else{
                let ans = Int(input)! + Int(update)!
                input = String(ans)
            }
            
           
        case "*":
            
            if input.contains(".") || update.contains("."){
            let ans = Float(input)! * Float(update)!
            input = String(ans)
            }else{
                let ans = Int(input)! * Int(update)!
                input = String(ans)
            }

        case "-":
            
            if input.contains(".") || update.contains("."){
            let ans = Float(input)! - Float(update)!
            input = String(ans)
            }else{
                let ans = Int(input)! - Int(update)!
                input = String(ans)
            }
            
        case "/":
            if input.contains(".") || update.contains("."){
            let ans = Double(input)! / Double(update)!
            input = String(ans)
            }else{
                let ans = Double(input)! / Double(update)!
                input = String(ans)
            }
            
        case "%":
            
            if input.contains(".") || update.contains("."){
               let ans = Double(input)! / 100
               input = String(ans)
            }else{
                let ans = Double(input)! / 100
                input = String(ans)
            }
        default: break
        }
        update="0"
    }

    var body: some View {
       
        VStack{
            Spacer()
            HStack{
            Spacer()
            if update != "0"{
                Text(String(update)).font(.system(size: 100)).fontWeight(.light).padding(.trailing, 40.0)
            }else{
                Text(String(input)).font(.system(size: 100)).fontWeight(.light).padding(.trailing, 40.0)
            }
            
            }
            
            
            HStack{
                Button(action: {
                    
                    if input != "0" && update == "0"{
                      input="0"
                        minus=false
                       
                    }else if input != "0" && update != "0" {
                        update="0"
                        minus=false
                        }
                    if input == "0" && update == "0" && operation != ""{
                        operation = ""
                    }
                }){
                    if update == "0" && input == "0" && operation == "" {
                    ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(.gray)
                        Text("AC").font(.largeTitle).fontWeight(.medium).foregroundColor(.black)
                        
                      }
                    }else if input != "0" || update != "0" || operation != ""{
                        ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(.gray)
                        Text("C").font(.largeTitle).fontWeight(.medium).foregroundColor(.black)
                      }
                    }
                }
                
                
                Button(action: {
                    
                    self.minus.toggle()
                    if update == "0" && minus == true{
                        input = "-" + input
                    }
                    if input != "0" && minus == true{
                        update = "-" + update
                    }
                    
                
                }){
                    ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(.gray)
                        Text(Image(systemName: "plus.forwardslash.minus")).font(.largeTitle).fontWeight(.medium).foregroundColor(.black)

                    }
                }
                
                Button(action: {
                    operation="%"
                  operate()
                    
                    
                }){
                    ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(.gray)
                        Text(Image(systemName: "percent")).font(.largeTitle).fontWeight(.medium).foregroundColor(.black)
                        
                    }
                }
                
                Button(action: {
                  
                    operate()
                    operation="/"
                    
                }){
                    if operation=="/" && update=="0"{
                        ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(.white)
                            Text(Image(systemName: "divide")).font(.largeTitle).fontWeight(.medium).foregroundColor(Color("orange"))
                        }
                    }
                    else{
                        ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(Color("orange"))
                            Text(Image(systemName: "divide")).font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                        }
                    }
                }
                
            }
            
            HStack{
                Button(action: {
                    
                    if operation=="" && input=="0"{
                       input = "7"
                        
                    }else if operation=="" && input != "0" {
                        input = input + "7"
                        }
                    
                    if operation != "" && update=="0"{
                        update = "7"
                    }else if operation != "" && update != "0"{
                        update = update + "7"
                    }
                    
                    fordot=""
                }){
                    ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(Color("darkgray"))
                        Text("7").font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                        
                    }
                }
                
                Button(action: {
                    
                    if operation=="" && input=="0"{
                       input = "8"
                        
                    }else if operation=="" && input != "0" {
                        input = input + "8"
                        }
                    
                    if operation != "" && update=="0"{
                        update = "8"
                    }else if operation != "" && update != "0"{
                        update = update + "8"
                    }
                    
                    fordot=""
                    
                }){
                    ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(Color("darkgray"))
                        Text("8").font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                        
                    }
                }
                
                Button(action: {
                    if operation=="" && input=="0"{
                       input = "9"
                        
                    }else if operation=="" && input != "0" {
                        input = input + "9"
                        }
                    
                    if operation != "" && update=="0"{
                        update = "9"
                    }else if operation != "" && update != "0"{
                        update = update + "9"
                    }
                    
                    fordot=""
                    
                }){
                    ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(Color("darkgray"))
                        Text("9").font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                        
                    }
                }
                
                Button(action: {

                    operate()
                    operation="*"
                    
                    
                }){
                    if operation=="*" && update=="0"{
                        ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(.white)
                            Text(Image(systemName: "multiply")).font(.largeTitle).fontWeight(.medium).foregroundColor(Color("orange"))
                        }
                    }
                    else{
                        ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(Color("orange"))
                            Text(Image(systemName: "multiply")).font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                        }
                    }
                }
            }
            
            HStack{
                Button(action: {
                    
                    if operation=="" && input=="0"{
                       input = "4"
                        
                    }else if operation=="" && input != "0" {
                        input = input + "4"
                        }
                    
                    if operation != "" && update=="0"{
                        update = "4"
                    }else if operation != "" && update != "0"{
                        update = update + "4"
                    }
                    
                    fordot=""
                    
                }){
                    ZStack{
                        Circle().frame(width: 90, height: 80).foregroundColor(Color("darkgray"))
                        Text("4").font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                        
                    }
                }
                
                Button(action: {
                    
                    if operation=="" && input=="0"{
                       input = "5"
                        
                    }else if operation=="" && input != "0" {
                        input = input + "5"
                        }
                    
                    if operation != "" && update=="0"{
                        update = "5"
                    }else if operation != "" && update != "0"{
                        update = update + "5"
                    }
                    
                    fordot=""
                    
                }){
                    ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(Color("darkgray"))
                        Text("5").font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                        
                    }
                }
                
                Button(action: {
                    
                    if operation=="" && input=="0"{
                       input = "6"
                        
                    }else if operation=="" && input != "0" {
                        input = input + "6"
                        }
                    
                    if operation != "" && update=="0"{
                        update = "6"
                    }else if operation != "" && update != "0"{
                        update = update + "6"
                    }
                    
                    fordot=""
                    
                }){
                    ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(Color("darkgray"))
                        Text("6").font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                        
                    }
                }
                
                Button(action: {
                    
                    operate()
                    operation="-"
                    
                }){
                    if operation=="-" && update=="0"{
                        ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(.white)
                            Text(Image(systemName: "minus")).font(.largeTitle).fontWeight(.medium).foregroundColor(Color("orange"))
                        }
                    }
                    else{
                        ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(Color("orange"))
                            Text(Image(systemName: "minus")).font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                        }
                    }
                }
                
            }
            
            HStack{
                Button(action: {
                    
                    if operation=="" && input=="0"{
                       input = "1"
                        
                    }else if operation=="" && input != "0" {
                        input = input + "1"
                        }
                    
                    if operation != "" && update=="0"{
                        update = "1"
                    }else if operation != "" && update != "0"{
                        update = update + "1"
                    }
                    
                    fordot=""
                    
                }){
                    ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(Color("darkgray"))
                        Text("1").font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                        
                    }
                }
                
                Button(action: {
                    
                    if operation=="" && input=="0"{
                       input = "2"
                        
                    }else if operation=="" && input != "0" {
                        input = input + "2"
                        }
                    
                    if operation != "" && update=="0"{
                        update = "2"
                    }else if operation != "" && update != "0"{
                        update = update + "2"
                    }
                    
                    fordot=""
                    
                }){
                    ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(Color("darkgray"))
                        Text("2").font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                        
                    }
                }
                
                Button(action: {
                    
                    if operation=="" && input=="0"{
                       input = "3"
                        
                    }else if operation=="" && input != "0" {
                        input = input + "3"
                        }
                    
                    if operation != "" && update=="0"{
                        update = "3"
                    }else if operation != "" && update != "0"{
                        update = update + "3"
                    }
                    
                    fordot=""
                    
                    
                }){
                    ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(Color("darkgray"))
                        Text("3").font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                        
                    }
                }
                
                Button(action: {
                    
                   operate()

                    operation="+"
                }){
            
                        if operation=="+" && update=="0"{
                            ZStack{
                            Circle().frame(width: 80, height: 80).foregroundColor(.white)
                                Text(Image(systemName: "plus")).font(.largeTitle).fontWeight(.medium).foregroundColor(Color("orange"))
                            }
                        }
                        else{
                            ZStack{
                            Circle().frame(width: 80, height: 80).foregroundColor(Color("orange"))
                                Text(Image(systemName: "plus")).font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                            }
                      }
                }
            }
            HStack{
                Button(action: {
                    if operation=="" && input=="0"{
                       
                        
                    }else if operation=="" && input != "0" {
                        input = input + "0"
                        }
                    
                    if operation != "" && update=="0"{
                        
                    }else if operation != "" && update != "0"{
                        update = update + "0"
                    }
                    
                    fordot=""
                }){
                    ZStack{
                        Capsule().frame(width: 170, height: 80).foregroundColor(Color("darkgray"))
                        Text("0").font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                        
                    }
                }
                
                Button(action: {
                   
                    fordot=fordot + "."
                    
                    if operation=="" && fordot=="."{
                       input = input + "."
                        
                    }else if operation != "" && fordot=="."{
                        update = update + "."
                        
                    }
                    
                }){
                    ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(Color("darkgray"))
                        Text(".").font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                        
                    }
                }
                
                Button(action: {
                    
                    operate()
                    operation=""
                    
                }){
                    ZStack{
                        Circle().frame(width: 80, height: 80).foregroundColor(Color("orange"))
                        Text(Image(systemName: "equal")).font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
    }
}
