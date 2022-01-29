class Solution(object):
    def insert(self, intervals, newInterval):
        """
        :type intervals: List[List[int]]
        :type newInterval: List[int]
        :rtype: List[List[int]]
        """
        intervals.append(newInterval)
        intervals.sort(key = lambda i : i[0])

        rs=[intervals[0]]
        for k in range(1,len(intervals)):
            if rs[-1][1]>=intervals[k][0]:
                rs[-1][1]=max(rs[-1][1],intervals[k][1])
            else:
                rs.append(intervals[k])

        return rs






        

intervals = [[1,3],[6,9]]
newInterval = [2,5]
print(Solution().insert(intervals,newInterval))