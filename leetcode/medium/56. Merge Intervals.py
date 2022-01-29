class Solution(object):
    # 先排序,merge
    def merge(self, intervals):
        """
        :type intervals: List[List[int]]
        :rtype: List[List[int]]
        """
        intervals.sort(key = lambda i : i[0])
        rs = [intervals[0]]
        for v in intervals[1:]:
            if v[0] <= rs[-1][1]:
                rs[-1][1]=max(rs[-1][1],v[1])
            else:
                rs.append(v)
        return rs
        

intervals = [[1,3],[2,6],[8,10],[15,18]]
print(Solution().merge(intervals))