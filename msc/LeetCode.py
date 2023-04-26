from typing import List, Optional, Set


class Solution:
    """
    Hunter Baxter's solutions to LeetCode problems.

    The solutions are arranged in order.
    Space Complexity is additional storage necessary for things besides the input.
    """

    def check(self, f, expected_output, *args) -> None:
        """
        Just a function to nicely test things
        """
        result = f(*args)
        if result != expected_output:
            print(f"\nFunction: {f.__name__}")
            for i in range(0, len(args)):
                print(f"Input {i}: {args[i]}")
            print(f"Expected output: {expected_output}")
            print(f"Actual output: {result}\n")
            raise ValueError("Incorrect Answer")

    def search(self, nums: List[int], target: int) -> int:
        """
        # 33. Search in Rotated Sorted Array (Medium)

        Runtime: O(lgn)
        Space Complexity: O(1)

        This is a binary search problem.
        We just have to check if value at low is less than the value at mid.
        If the value at low is less than the value at mid, then the left half is properly sorted, else the right half is properly sorted.
        Once we know that, we just have to use basic logic.
        """
        lo, hi = 0, len(nums) - 1
        while lo <= hi:
            mid = (lo + hi) // 2
            if nums[mid] == target:
                return mid

            # left half is sorted properly
            if nums[lo] <= nums[mid]:
                if nums[lo] <= target < nums[mid]:
                    hi = mid - 1
                else:
                    lo = mid + 1

            # right half is sorted properly
            else:
                if nums[mid] < target <= nums[hi]:
                    lo = mid + 1
                else:
                    hi = mid - 1

        return -1

    def searchRange(self, nums: List[int], target: int) -> List[int]:
        """
        # 34 Find First and Last Position of Element in Sorted Array (Medium)

        Runtime: O(lgn)
        Space Complexity: O(1)

        The brute force solution is O(n) by doing a linear scan until first and last values of target are seen.

        The general strategy is to find one value of target, then run two binary searches to find the low and high indices.
        This probably could have been made more efficient by finding mid first, since we repeat work.
        """

        def find_bound(nums: List[int], target: int, lower: bool) -> int:
            lo, hi = 0, len(nums) - 1

            while lo <= hi:
                mid = (lo + hi) // 2

                if nums[mid] == target:
                    if lower:
                        if mid == lo or nums[mid - 1] < target:
                            return mid
                        else:
                            hi = mid - 1
                    else:
                        if mid == hi or nums[mid + 1] > target:
                            return mid
                        else:
                            lo = mid + 1

                elif nums[mid] > target:
                    hi = mid - 1
                else:
                    lo = mid + 1

            return -1
        low = find_bound(nums, target, True)
        if low == -1:
            return [-1, -1]
        return [low, find_bound(nums, target, False)]

    def maxSubArray(self, nums: List[int]) -> int:
        """
        # 53

        Runtime: O(n)
        """
        m = nums[0]
        c = 0
        for x in nums:
            c = max(x, c + x)
            m = max(m, c)
        return m

    def containsDuplicate(self, nums: List[int]) -> bool:
        """
        # 217

        Runtime: O(n)
        """
        seen = set()
        for i in nums:
            if i in seen:
                return True
            seen.add(i)
        return False

    def pivotIndex(self, nums: List[int]) -> int:
        """
        # 724

        Runtime: O(n)
        """
        s = sum(nums)
        ls = 0
        for i in range(0, len(nums)):
            if ls == s - nums[i]:
                return i
            ls += nums[i]
            s -= nums[i]
        return -1

    def runningSum(self, nums: List[int]) -> List[int]:
        """
        # 1480

        Runtime: O(n)
        """
        for i in range(1, len(nums)):
            nums[i] += nums[i - 1]
        return nums


s = Solution()

iN = [4,5,6,7,0,1,2]
out = 4
s.check(s.search, out, iN, 0)

iN = [4,5,6,7,0,1,2]
out = -1
s.check(s.search, out, iN, 3)

iN = [1]
out = -1
s.check(s.search, out, iN, 0)

iN = [5, 1, 3]
out = -1
s.check(s.search, out, iN, 2)

print("PASSED TESTS")
