class Solution(object):
    # hashmap, 用26个ascii数组作为key
    def groupAnagrams(self, strs):
        """
        :type strs: List[str]
        :rtype: List[List[str]]
        """
        hashmap={}
        for s in strs:
            k = [0]*26
            for c in s:
                k[ord(c)-ord("a")]+=1
            k=tuple(k)
            if k in hashmap:
                hashmap[k].append(s)
            else:
                hashmap[k]=[s]
        return hashmap.values()

strs = ["eat","tea","tan","ate","nat","bat"]
print(Solution().groupAnagrams(strs))