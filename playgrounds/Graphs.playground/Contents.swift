// Graphs
// Source: 

// Basic vertex data structure
public class Vertex {
    var key: String?
    
    // Adjacency lists
    var neighbors: Array<Edge>
    
    init(){
        self.neighbors = Array<Edge>()
    }
    
}

// Edge data structure
public class Edge {
    var neighbor: Vertex
    var weight: Int
    
    init() {
        weight = 0
        self.neighbor = Vertex()
    }
}

// A default Directed Graph Canvas
public class SwiftGraph {
    private var canvas: Array<Vertex>
    public var isDirected: Bool
    
    init() {
        canvas = Array<Vertex>()
        isDirected = true
    }
    
    // Create a new vertex
    func addVertex(key:String) -> Vertex {
    
        // Set the key
        var childVertex: Vertex = Vertex()
        childVertex.key = key
        
        // Add the vertex to the graph canvas
        canvas.append(childVertex)
        
        return childVertex
    }
    
    // Add an edge to source vertex
    func addEdge(source: Vertex, neightbor: Vertex, weight: Int) {
        
        // Create a new edge
        var newEdge = Edge()
        
        // Establish the default properties
        newEdge.neighbor = neightbor
        newEdge.weight = weight
        source.neighbors.append(newEdge)
        
        // Check for undirected graph
        if (isDirected == false) {
            // Create a new reversed edge
            var reverseEdge = Edge()
            
            // Establish the reversed properties
            reverseEdge.neighbor = source
            reverseEdge.weight = weight
            neightbor.neighbors.append(reverseEdge)
        }
    }
}

// Dijkstra's shortest path
class Path {
    
    var total: Int!
    var destination: Vertex
    var previous: Path!
    
    // Object initialization
    init() {
        destination = Vertex()
    }
}

// Process Dijkstra's shortest path algorithm
func processDijkstra(source: Vertex, destination: Vertex) -> Path? {
    
    var frontier: Array = Array<Path>()
    var finalPaths: Array = Array<Path>()
    
    // Use source edges to create the frontier
    for e in source.neighbors {
        
        var newPath: Path = Path()
        
        newPath.destination = e.neighbor
        newPath.previous = nil
        newPath.total = e.weight
        
        // Add the new path to the frontier
        frontier.append(newPath)
    }
    
    // Construct the best path
    var bestPath: Path = Path()
    
    while (frontier.count != 0) {
        
        // Support path changes using the greedy approach
        bestPath = Path()
        
        var x: Int = 0
        var pathIndex: Int = 0
        
        for x in (0 ..< frontier.count) {
            let itemPath: Path = frontier[x]
            
            if ( (bestPath.total == nil) || (itemPath.total < bestPath.total)) {
                bestPath = itemPath
                pathIndex = x
            }
        }
        
        // Enumerate the bestPath edges
        for e in bestPath.destination.neighbors {
            
            let newPath: Path = Path()
            
            newPath.destination = e.neighbor
            newPath.previous = bestPath
            newPath.total = bestPath.total + e.weight
            
            // Add the new path to the frontier
            frontier.append(newPath)
        }
        
        // Preserve the bestPath
        finalPaths.append(bestPath)
        
        // Remove the bestPath from the frontier
        frontier.remove(at: pathIndex)
    }
    
    // Establish the shortest path as an optional
    var shortestPath: Path! = Path()
    
    for itemPath in finalPaths {
        if (itemPath.destination.key == destination.key) {
            if (shortestPath.total == nil) || (itemPath.total < shortestPath.total) {
                shortestPath = itemPath
            }
        }
    
    }
    
    return shortestPath
}




