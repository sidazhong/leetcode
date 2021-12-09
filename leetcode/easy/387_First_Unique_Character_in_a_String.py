class Solution(object):
    # hashmap计数， 查询为1的结果
    def firstUniqChar(self, s):
        """
        :type s: str
        :rtype: int
        """
        hashmap={}
        for k in s:
            if(k not in hashmap):
                hashmap[k]=1
            else:
                hashmap[k]+=1

        rs=0
        for k in s:
            if hashmap[k]==1:
                return rs
            else:
                rs+=1

        return -1


s = "loveleetcode"
print(Solution().firstUniqChar(s))