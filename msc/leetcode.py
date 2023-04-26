from typing import List, Optional, Set

class Solution:
    def check(self, f, input_value, expected_output):
        result = f(input_value)
        if result != expected_output:
            print(f"Function: {f.__name__}")
            print(f"Input: {input_value}")
            print(f"Expected output: {expected_output}")
            print(f"Actual output: {result}")
            raise ValueError("Incorrect Answer")
    # 53
    def maxSubArray(self, nums: List[int]) -> int:
        m = nums[0]
        c = 0
        for x in nums:
            c = max(x, c + x)
            m = max(m, c)
        return m

    # 217
    def containsDuplicate(self, nums: List[int]) -> bool:
        seen = set()
        for i in nums:
            if i in seen:
                return True
            seen.add(i)
        return False

    # 724
    def pivotIndex(self, nums: List[int]) -> int:
        s = sum(nums)
        ls = 0
        for i in range(0, len(nums)):
            if ls == s - nums[i]:
                return i
            ls += nums[i]
            s -= nums[i]
        return -1

    # 1480
    def runningSum(self, nums: List[int]) -> List[int]:
        for i in range(1, len(nums)):
            nums[i] += nums[i - 1]
        return nums
    

s = Solution()
iN = [-2,1,-3,4,-1,2,1,-5,4]
out = 6
print("PASSED TESTS")
