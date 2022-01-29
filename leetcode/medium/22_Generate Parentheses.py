class Solution(object):
    def generateParenthesis(self, n):
        '''
        # 动态循环, open==close==n, close<open， 
        rs=[]
        def loop(k,v):
            if v.count(")") > v.count("("):
                return 
            
            if k==2*n:
                if v.count(")") == v.count("("):
                    rs.append(v)
                return

            for vv in "()":
                loop(k+1,v+vv)

        loop(0,"")
        return rs
        '''

        # 歪门邪道的
        rs = []
        def loop(v,open,close):
            if open:
                loop(v+"(",open-1,close)
            if open<close:
                loop(v+")",open,close-1)
            if not close:
                rs.append(v)

        loop("",n,n)
        return rs

        '''
        # 递归
        rs= []
        pool = []
        def loop(open,close):
            if open == close == n:
                rs.append("".join(pool))

            if open < n:
                pool.append("(")
                loop(open+1,close)
                pool.pop()
            
            if close < open:
                pool.append(")")
                loop(open,close+1)
                pool.pop()

        loop(0,0)
        return rs
        '''
        
n=2
print(Solution().generateParenthesis(n))