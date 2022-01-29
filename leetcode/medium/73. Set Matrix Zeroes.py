class Solution(object):
    def setZeroes(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: None Do not return anything, modify matrix in-place instead.
        暴搜循环,更新行和列
        """
        '''
        copy_matrix=[]
        for r in matrix:
            row=[]
            for c in r:
                row.append(c)
            copy_matrix.append(row)

        for r in range(len(matrix)):
            for c in range(len(matrix[r])):
                if matrix[r][c] == 0:
                    # 更新行
                    for k in range(len(matrix[r])):
                        copy_matrix[r][k]=0
                    # 更新列
                    for k in range(len(matrix)):
                        for kk in range(len(matrix[r])):
                            copy_matrix[k][c]=0

        for k in range(len(copy_matrix)):
            for kk in range(len(copy_matrix[k])):
                matrix[k][kk]=copy_matrix[k][kk]

        return matrix
        '''
        
        """
        横排,竖排记录,一次更新矩阵
              1 0 0 1
        1    [0,1,2,0],
        0    [3,4,5,2],
        0    [1,3,1,5]]
        """
        '''
        row=[0]*len(matrix)
        col=[0]*len(matrix[0])
        for r in range(len(matrix)):
            for c in range(len(matrix[r])):
                if matrix[r][c]==0:
                    row[r]=1
                    col[c]=1

        for r in range(len(matrix)):
            for c in range(len(matrix[r])):
                if row[r]==1:
                    matrix[r][c]=0
                if col[c]==1:
                    matrix[r][c]=0
        return matrix
        '''
        """
        横排,竖排为矩阵自己,额外占用左上角,一次更新矩阵
               * * * *
        0     [0,1,2,0],
        *     [3,4,5,2],
        *     [1,3,1,5]]
        """
        '''
        top_left=1
        for r in range(len(matrix)):
            for c in range(len(matrix[r])):
                if matrix[r][c]==0:
                    matrix[0][c]=0
                    if r==0:
                        top_left=0
                    else:
                        matrix[r][0]=0
        
        for r in range(1,len(matrix)):
            for c in range(1,len(matrix[r])):
                if matrix[0][c]==0 or matrix[r][0]==0:
                    matrix[r][c]=0

        if matrix[0][0]==0:
            for r in range(len(matrix)):
                matrix[r][0]=0
        if top_left==0:
            for c in range(len(matrix[0])):
                matrix[0][c]=0

        return matrix
        '''

        # 理解, 方案1其实最好,可以依据条件封装类,还可以复制元矩阵操作,更容易测试. 方案3最差,耍小聪明,非常难解释. 方案2是3分熟牛排
        
matrix = [
    [0,1,2,0],
    [3,4,5,2],
    [1,3,1,5]]
print(Solution().setZeroes(matrix))