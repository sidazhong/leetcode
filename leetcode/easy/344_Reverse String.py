# 双指针交换
class Solution(object):
    def reverseString(self, s):
        """
        :type s: List[str]
        :rtype: None Do not return anything, modify s in-place instead.
        """
        p1=0
        p2=len(s)-1

        while p1<p2:
            s[p1],s[p2]=s[p2],s[p1]
            p1+=1
            p2-=1
        return s


s = ["A"," ","m","a","n",","," ","a"," ","p","l","a","n",","," ","a"," ","c","a","n","a","l",":"," ","P","a","n","a","m","a"]
print(Solution().reverseString(s))