// this code is in python.
// will move this to python repo.

//define array of MxN where M = N
//a1 is 6x6 and a2 is 4x4

//#a1 = [[1 ,2 ,3 ,4 ,5 ,6 ],[7 ,8 ,9 ,10,11,12],[13,14,15,16,17,18],[19,20,21,22,23,24],[25,26,27,28,29,30],[31,32,33,34,35,36]]
//#a2 = [[1 ,2 ,3 ,4  ],[5,6,7,8],[9 ,10,11,12],[13,14,15,16]]
def array_rotate(<array>):
    for i in range(len(a)):
        for j in range(len(a[i])):
            print( a[i][j], end=" ")
        print()
        
    m = len(a)-1
    n = len(a[0])-1
    count = 0
    temp = 0
        
    for i in range(0,m):
        for j in range (0,n):
            temp             = a[i][i+j]
            a[i][i+j]        = a[i+j][n-i]
            a[i+j][n-i]      = a[m-i][n-(i+j)]
            a[m-i][n-(i+j)]  = a[m-(i+j)][i]
            a[m-(i+j)][i]    = temp
                
            count = count + 4
                
            if count >= (len(a)*len(a[j]) - 4 ):
                break
            
        if count == (len(a)*len(a[j])):
                break
    
    print()
    
    for i in range(len(a)):
        for j in range(len(a[i])):
            print( a[i][j], end=" ")
        print()
                
