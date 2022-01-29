class Solution(object):
    def subsets(self, nums):
        rs=[]
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        '''
        # 动态暴力循环 
        rs = []
        def loop (k,v):
            if v not in rs: 
                rs.append(v)
            if k==len(nums):
                return
            
            for kk in range(k,len(nums)):
                if nums[kk] not in v:
                    tmp=v[:]
                    tmp.append(nums[kk])
                    tmp.sort()
                    loop(k+1,tmp)
            
        loop(0,[])
        return rs
        '''

        '''
        选或不选
        有条件做记录
        加入 + 递归
        不加入 + 递归
        '''
        '''
        rs=[]
        def loop(k,v):
            if k==len(nums):
                rs.append(v[:])
                return

            v.append(nums[k])
            loop(k+1,v)
            v.pop()

            loop(k+1,v)

        loop(0,[])
        return rs
        '''
        '''
        经典回溯算法, 循环一直往前走, 加进去在吐出来
        思路: 1 选 1,2 选 1,2,3 选 
        条件: 无

        1   ->  12  ->  123
            ->  13  
        2   ->  23
        3   
        '''
        rs=[]
        def loop(k,v):
            rs.append(v[:])
            for kk in range(k,len(nums)):
                v.append(nums[kk])
                loop(kk+1,v)
                v.pop()

        loop(0,[])
        return rs

        
nums = [1,2,3]
print(Solution().subsets(nums))