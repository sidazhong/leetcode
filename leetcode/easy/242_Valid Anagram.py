class Solution(object):

    # 排序比较
    '''
    def isAnagram(self, s, t):

        rs1=list(s)
        rs1.sort()
        rs2=list(t)
        rs2.sort()

        return rs1==rs2
    '''

    #hashmap
    def isAnagram(self, s, t):
        
        hashmap={}
        for k in s:
            if k in hashmap.keys():
                hashmap[k]+=1
            else:
                hashmap[k]=1

        for k in t:
            if k in hashmap.keys():
                hashmap[k]-=1
            else:
                hashmap[k]=1

        for k in hashmap:
            if(hashmap[k]!=0):
                return False

        return True

s = "acbb"
t = "bbac"
print(Solution().isAnagram(s, t))