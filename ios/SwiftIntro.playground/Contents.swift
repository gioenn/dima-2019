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


add1AndApply(5, f: { $0*$0*$0 })

let r = 1...10

r.map(square)
