class Solution(object):
    # 切一半 
    '''
    def isPalindrome(self, x):
        """
        :type x: int
        :rtype: bool
        """

        if(x <= 0) or (x > 0 and x %10 ==0):
            return False

        r = 0
        while x > r:
            digit = x % 10
            r = r * 10 + digit
            if(x > r):
                x //= 10

        return x == r
    '''

    # 双指针 从两边往中间
    '''
    def isPalindrome(self, x):
        x=str(x)
        p1=0
        p2=len(x)-1

        while p1 <= p2:
            if(x[p1]!=x[p2]):
                return False

            p1+=1
            p2-=1

        return True
    '''
    # 双指针 从中间往两边
    def isPalindrome(self, x):
        x=str(x)

        if(len(x)%2==1):
            l = r = len(x) // 2
        else:
            l = len(x) // 2
            r = l-1

        while l>=0:
            if (x[l]!=x[r]):
                return False

            l-=1
            r+=1

        return True


x=123321
print(Solution().isPalindrome(x))