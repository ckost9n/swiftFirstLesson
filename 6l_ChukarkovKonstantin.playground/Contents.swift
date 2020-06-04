
struct Stack<Element> {
    
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    mutating func append(_ item: Element) {
        self.push(item)
    }
    
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element? {
        if i < items.count {
            return items[i]
        }
        return nil
    }
    
}


var stack = Stack<String>()

stack.push("кот")
stack.push("бегемот")
stack.push("жираф")
stack.push("крыса")

stack.pop()

print(stack.count)


print(stack[1]!)
print(stack[4] as Any)
