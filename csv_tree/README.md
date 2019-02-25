Question: You are given a CSV file with 3 columns -- all integers: 

id,parent,weight 
10,30,1 
30,0,10 
20,30,2 
50,40,3 
40,30,4 

0 is the assumed root node with weight 0 

which describes a tree-like structure -- each line is a node, 'parent' refers to 'id' of another node. 

Print out, for each node, the total weight of a subtree below this node (by convention, the weight of a subtree for node X includes the own weight of X). 

You may assume that the input comes pre-parsed as a sequence of Node objects 
(substitute the appropriate syntax for java/python/c++): 

Node { 
int id; 
int parent; 
int weight; 
// ... you can add other fields right here, if necessary 
} 

implement the following: 
public void printSubTreeWeight(List<Node> nodes) { 
....}