class Solution(object):
    # python 特殊写法，直接加
    def addBinary(self, a, b):
        """
        :type a: str
        :type b: str
        :rtype: str
        """
        return "{0:b}".format(int(a, 2) + int(b, 2))
    
a = "1010"
b = "1011"

print(Solution().addBinary(a,b))