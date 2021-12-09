from typing import List

class Solution(object):
    # hashtable + 移除当前元素
    '''
    def intersect(self, nums1, nums2):
        """
        :type nums1: List[int]
        :type nums2: List[int]
        :rtype: List[int]
        """
        rs=[]
        for k in range(len(nums1)):
            if(nums1[k] in nums2):
                rs.append(nums1[k])
                nums2.remove(nums1[k])

        return rs
        '''
    # hashtable + 计数
    '''
    def intersect(self, nums1, nums2):
        rs=[]
        hashmap={}
        for k in range(len(nums1)):
            if nums1[k] not in hashmap:
                hashmap[nums1[k]]=1
            else:
                hashmap[nums1[k]]+=1
        
        for k in range(len(nums2)):
            if nums2[k] in hashmap and hashmap[nums2[k]]!=0:
                rs.append(nums2[k])
                hashmap[nums2[k]]-=1
                
        return rs
    '''
    
    # sort + 双指针 小数字移动
    def intersect(self, nums1, nums2):
        nums1.sort()
        nums2.sort()
        rs=[]
        p1=0
        p2=0
        while p1<len(nums1) and p2<len(nums2):
            if nums1[p1] == nums2[p2]:
                rs.append(nums1[p1])
                p1+=1
                p2+=1
            else:
                if(nums1[p1]<nums2[p2]):
                    p1+=1
                else:
                    p2+=1
        
        return rs



        
nums1 = [4,9,5,4,4]
nums2 = [9,4,9,8,4]
print(Solution().intersect(nums1,nums2))