class Solution(object):
    '''
    4指针转圈
    正方形矩阵指针
        l       r
    t   1 1 1 1 1
        1 1 1 1 1
        1 1 1 1 1
    b   1 1 1 1 1

    上下，左右指针不过位
    l->r
    t->b
    r->l
    b->t
    移动上下左右指针
    '''
    def spiralOrder(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: List[int]
        """
        l=0
        r=len(matrix[0])-1
        t=0
        b=len(matrix)-1

        rs=[]
        while l<=r and t<=b:
            for k in range(l,r+1):
                rs.append(matrix[t][k])
            t+=1
            for k in range(t,b+1):
                rs.append(matrix[k][r])
            r-=1
            if not (l<=r and t<=b):
                break

            for k in reversed(range(l,r+1)):
                rs.append(matrix[b][k])
            b-=1
            for k in reversed(range(t,b+1)):
                rs.append(matrix[k][l])
            l+=1

        return rs
        
matrix = [
    [1,2,3],
    [4,5,6],
    [7,8,9]]
matrix = [
    [1 ,2 ,3 ,4],
    [5 ,6 ,7 ,8],
    [9 ,10,11,12]]
matrix = [
    [2,5,8],
    [4,0,-1]]
print(Solution().spiralOrder(matrix))