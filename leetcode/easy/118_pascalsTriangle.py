

# 双循环，外循环两头+1, 内循环两两相加
class Solution(object):
    def generate(self, numRows):
        prev_row=[1]
        rs=[prev_row]

        for k in range(1,numRows):
            insert_row=[]
            insert_row.append(1)
            for kk in range(1,len(prev_row)):
                insert_row.append(prev_row[kk-1]+prev_row[kk])
            insert_row.append(1)
            rs.append(insert_row)

            prev_row=insert_row
        return rs

numRows=5
print(Solution().generate(numRows))