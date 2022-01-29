class Solution(object):
    def permute(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        '''
        经典回溯算法, 循环一直往前走, 加进去在吐出来
        思路: 1,2,3 选 1,2,3 选 1,2,3 选 3次喊停 递归 
        特殊条件: 不能每次选重复了
        '''
        rs=[]
        def loop(k,v):
            if len(v)==len(nums):
                rs.append(v[:])
                return
            for kk in range(len(nums)):
                v.append(nums[kk])
                loop(k+1,v)
                v.pop()
        loop(0,[])
        return rs
        # 第1个元素和第K个互换
        '''
        rs = []
        def loop(k):
            if k==len(nums):
                rs.append(nums[:])
                return 
            for kk in range(k,len(nums)):
                nums[k], nums[kk] = nums[kk], nums[k]
                loop(k+1)
                nums[k], nums[kk] = nums[kk], nums[k]

        loop(0)
        return rs
        '''

nums = [1,2,3]
print(Solution().permute(nums))