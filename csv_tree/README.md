## CSV Tree

You are given a CSV file with 3 columns, all integers, which describes a tree-like structure - each line is a node, *parent* refers to an *id* of another node (0 is the assumed to be the root node with weight 0): 

    id,parent,weight 
    10,30,1 
    30,0,10 
    20,30,2 
    50,40,3 
    40,30,4 

For each node, print out the total weight of a subtree below this node (by convention, the weight of a subtree for node *X* includes the weight of *X*). 

You may assume that the input comes pre-parsed as a sequence of Node objects  (substitute the appropriate syntax for Java/Python/C++): 

    Node {
        int id;
        int parent;
        int weight;

        // ... you can add other fields right here, if necessary 
    } 

Implement the following function:
    
    public void printSubTreeWeight(List<Node> nodes) {...}
