## All unique triplets that sum up to a given value

Given an array and a value, find all possible unique triplets in that array whose sum is equal to the given value. If no such triplets can be formed from the array, then print “No triplets can be formed”, else print all the unique triplets. For example, if the given array is {12, 3, 6, 1, 6, 9} and given sum is 24, then the unique triplets are (3, 9, 12) and (6, 6, 12) whose sum is 24.

Examples:

    Input : array = {12, 3, 6, 1, 6, 9} sum = 24
    Output : [[3, 9, 12], [6, 6, 12]]

    Input : array = {-2, 0, 1, 1, 2} sum = 0
    Output : [[-2, 0, 2], [-2, 1, 1]]

    Input : array = {-2, 0, 1, 1, 2} sum = 10
    Output : No triplets can be formed