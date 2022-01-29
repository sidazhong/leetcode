class Solution(object):
    '''
    4指针转圈
    正方形矩阵指针
        l       r
    t   1 1 1 1 1
        1 1 1 1 1
        1 1 1 1 1
    b   1 1 1 1 1

    左右指针不过位
    上左角移除并储存
    下左角移动到上左角
    下右角移动到下左角
    上右角移动到下右角
    上右角移动到上右角
    移动左右指针
    '''
    def rotate(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: None Do not return anything, modify matrix in-place instead.
        """
        l=0
        r=len(matrix)-1
        t=0
        b=len(matrix)-1

        while l<=r:
            for k in range(r-l):
                tmp = matrix[t][l+k]
                matrix[t][l+k] = matrix[b-k][l]
                matrix[b-k][l] = matrix[b][r-k]
                matrix[b][r-k] = matrix[t+k][r]
                matrix[t+k][r] = tmp

            l+=1 
            r-=1
            t+=1
            b-=1

        return matrix
        

#[[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]        

matrix = [
    [1,2,3],
    [4,5,6],
    [7,8,9]]
matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
print(Solution().rotate(matrix))