// LinkedList
// Source: http://goo.gl/ysg92v

import Foundation

// Double LinkedList structure
class LLNode<T> {
    var key: T?
    var next: LLNode?
    var previous: LLNode?
}

public class LinkedList<T: Equatable>{

    // create a new LLNode instance
    private var head: LLNode<T> = LLNode<T>()
    
    // The number of linked items
    var count: Int{
        get{
            return 0
        }
    }
    
    // Append a new item to a linked list
    func addLink(key:T){
    
    }
    
    // Remove a link at a specific index
    func removeLinkAtIndex(index: Int){
    
    }
    
    // Print all keys for the class
    func printAllKeys(){
    
    }
}