import UIKit

let one = 1
let two: Int = 2

var n = 1.0

n += 2.0

var hi = "Hi!!!"

for c in hi {
    print(c)
}


hi.append("???")

var greet: String? = "Hello"

greet?.append("ooo")

greet

var person: String? = "Silvia"

if var person = person {
    person.append("...")
    print(person)
}
else {
    print("person is nil")
}

func doGreet(who x: String){
    print("Hi \(x)")
}

if let person = person {
    doGreet(who: person)
}

var x : Int? = 2

func sum(_ a: Int?, _ b: Int?) -> Int? {
    if let a = a, let b = b {
        return a + b
    }
    else {
        return nil
    }
}

let y = sum(x, x)

var a = [1, 2, 3]
var b = a

a.append(4)

b

func square(_ n: Int) -> Int {
    return n*n
}


func add1AndApply(_ n: Int, f: (Int) -> Int) -> Int {
    return f(n+1)
}

add1AndApply(5, f: square)

add1AndApply(5, f: { $0*$0*$0 })
add1AndApply(5, f: { x in x*x*x})
add1AndApply(5, f: { (x: Int) in x*x*x})

let r = 1...10
let r1 = 1..<10

r.map(square)

var res = r.filter({ $0 % 2 == 0})
res

var res2 = r.reduce(0, { $0 + $1 })

res2

protocol HasSpeed {
    var speed: Int {get set}
    mutating func turnOn()
}

class Car: HasSpeed {
    var speed = 0
    func turnOn() {
        if speed == 0 {
            speed = 1
        }
    }
}

let car1 = Car()
car1.turnOn()
car1.speed += 5

car1.speed

// car1 = Car()

struct Car2 : HasSpeed {
    var speed = 0
    
    mutating func turnOn(){
        if speed == 0 {
            speed = 1
        }
    }
}

var car2 = Car2()
let car3 = car2
car2.turnOn()
car2.speed
car3.speed

var car4 = Car()
var car5 = car4
car4.turnOn()
car5.speed
