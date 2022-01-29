class Solution(object):

    # 暴力，低的高度,超时
    '''
    def maxArea(self, height):
        """
        :type height: List[int]
        :rtype: int
        """
        l = 0
        r = 0
        rs = 0
        for l in range(len(height)):
            r = l + 1
            for r in range(len(height)):
                min_height = min(height[l],height[r])
                rs = max(rs, (r - l) * min_height)

        return rs
    '''
    # 双指针往中间
    def maxArea(self, height):
        
        l = 0
        r = len(height)-1
        rs = 0
        while l != r:
            area = (r - l) * min (height[l],height[r])
            rs = max(rs,area)
            if height[l]<height[r]:
                l+=1
            else:
                r-=1

        return rs

height=[2,3,4,5,18,17,6]
print(Solution().maxArea(height))