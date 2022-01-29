class Solution(object):

    # 经典回溯算法, 循环一直往前走, 加进去在吐出来
    def letterCombinations(self, digits):
        """
        :type digits: str
        :rtype: List[str]
        """
        # 思路: abc 选 abc 选 abc 选 digits次喊停 递归 
        hashmap={
            "2":"abc",
            "3":"def",
            "4":"ghi",
            "5":"jkl",
            "6":"mno",
            "7":"pqrs",
            "8":"tuv",
            "9":"wxyz",
        }
        rs=[]
        def loop(k,v):
            if k==len(digits):
                rs.append(v)
                return
            for vv in hashmap[digits[k]]:
                v+=vv
                loop(k+1,v)
                v=v[:-1]
        if digits:
            loop(0,"")
        return rs

    '''
    def letterCombinations(self, digits):
        hashmap={
            "2":"abc",
            "3":"def",
            "4":"ghi",
            "5":"jkl",
            "6":"mno",
            "7":"pqrs",
            "8":"tuv",
            "9":"wxyz",
        }
        rs=[]
        for v in hashmap[digits[0]]:
            for vv in hashmap[digits[1]]:
                rs.append(v+vv)
        return rs
    '''

digits = "222"
print(Solution().letterCombinations(digits))