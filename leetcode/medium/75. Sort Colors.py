class Solution(object):
    def sortColors(self, nums):
        """
        :type nums: List[int]
        :rtype: None Do not return anything, modify nums in-place instead.
        """

        # 双指针前后 + 三指针遍历
        '''
        l=0
        r=len(nums)-1
        k=0
        while k<=r:
            if nums[k]==0:
                nums[l],nums[k] = nums[k],nums[l]
                l+=1
            if nums[k]==2:
                nums[r],nums[k] = nums[k],nums[r]
                r-=1
                k-=1
            k+=1
        return nums
        '''
        # hashtable 计数
        '''
        hashmap = {0:0,1:0,2:0}
        for v in nums:
            hashmap[v]+=1

        key=0
        for k,v in hashmap.items():
            while v:
                v-=1
                nums[key]=k
                key+=1

        return nums
        '''
        # 冒泡 两两互换
        '''
        for k in range(len(nums)):
            for kk in range(k+1,len(nums)):
                if nums[k]>nums[kk]:
                    nums[k],nums[kk] = nums[kk],nums[k]
        '''

        # 选择排序 找出最小的放最前面
        '''
        for k in range(len(nums)):
            min_k=k
            for kk in range(k+1,len(nums)):
                if nums[kk]<nums[min_k]:
                    min_k=kk
            nums[min_k],nums[k] = nums[k],nums[min_k]
        return nums
        '''

nums = [5,4,3,2,1,0]
print(Solution().sortColors(nums))