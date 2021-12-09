# 26base乘阶，ord获取assic码
class Solution(object):
    def titleToNumber(self, columnTitle):
        """
        :type columnTitle: str
        :rtype: int
        """
        #65
        rs=0
        length=len(columnTitle)
        for k in range(length):
            # 1*26**0   +   1*26**1
            asc_value=ord(columnTitle[k])-64
            rs+=asc_value*26**(length-k-1)

        return rs

columnTitle = "FXSHRXW"
print(Solution().titleToNumber(columnTitle))