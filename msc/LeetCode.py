import concurrent.futures
import itertools
from typing import Dict, List, Optional, Set, Tuple

from DataStructures import LinkedList, ListNode

TIMEOUT = 2

# leetcode.com/study-plan
# https://docs.python.org/3/library/stdtypes.html
# https://docs.python.org/3/library/itertools.html
# https://docs.python.org/3/library/collections.html
# https://docs.python.org/3/library/heapq.html


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

        # TODO: I should implement a timeout
        # with concurrent.futures.ThreadPoolExecutor() as executor:
        #     future = executor.submit(f, *args)
        #     timed_out = False
        #     try:
        #         result = future.result(TIMEOUT)
        #         if result != expected_output:
        #             print(f"\nFunction: {f.__name__}")
        #             for i in range(0, len(args)):
        #                 print(f"Input {i}: {args[i]}")
        #             print(f"Expected output: {expected_output}")
        #             print(f"Actual output: {result}\n")
        #             raise ValueError("Incorrect Answer")
        #     except concurrent.futures.TimeoutError:
        #         print("Function execution timed out.")
        #         timed_out = True
        #     finally:
        #         if timed_out:
        #             future.cancel()

    def twoSum(self, nums: List[int], target: int) -> List[int]:
        """
        # 1: Two Sum (Easy)
        Runtime: O(n)
        Space Complexity: O(n)
        """
        hm = {}
        for i in range(0, len(nums)):
            if nums[i] in hm:
                return [hm[nums[i]], i]
            else:
                hm[target - nums[i]] = i
        return None

    def maxArea(self, height: List[int]) -> int:
        """
        11. Container With Most Water (Medium)
        """

    def threeSum(self, nums: List[int]) -> List[List[int]]:
        """
        15: 3Sum (Medium)
        Find all triplets such that sum nums[i, j, k] == 0 and i != j != k
        Order of the output and the order of the triplets does not matter
        """
        pass

    def mergeTwoLists(
        self, list1: Optional[ListNode], list2: Optional[ListNode]
    ) -> Optional[ListNode]:
        """
        # 21: Merge Two Sorted Lists (Easy)
        """
        p1 = list1
        p2 = list2
        ret = ListNode(None)
        p = ret

        while p1 and p2:
            if p1.val <= p2.val:
                p.next = p1
                p1 = p1.next
            else:
                p.next = p2
                p2 = p2.next
            p = p.next

        # only one of these could be true
        p.next = p1 if p1 else p2
        return ret.next

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
        # 53: Maximum Subarray (Medium)

        Runtime: O(n)
        """

        m = nums[0]
        c = 0
        for x in nums:
            c = max(x, c + x)
            m = max(m, c)
        return m

    def isValidSudoku(self, board: List[List[str]]) -> bool:
        """
        # 36: Valid Sudoku (Medium)

        Runtime: O(n^2) for a nxn board
        Space Complexity: O(n^2) for a full board
        """

        def grid_map(x, y):
            a = x // 3
            b = y // 3
            # return some nu
            return (a * 3) + b

        row_sets = [set() for _ in range(0, 9)]
        column_sets = [set() for _ in range(0, 9)]
        grid_sets = [set() for _ in range(0, 9)]
        for x in range(0, 9):
            for y in range(0, 9):
                value = board[x][y]
                if value == ".":
                    continue

                if value in row_sets[x]:
                    return False
                else:
                    row_sets[x].add(value)

                if value in column_sets[y]:
                    return False
                else:
                    column_sets[y].add(value)

                mapped_grid = grid_map(x, y)
                if value in grid_sets[mapped_grid]:
                    return False
                else:
                    grid_sets[mapped_grid].add(value)
        return True

    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        """
        # 74: Search a 2D Matrix (Medium)

        ## Problem:

        You are given an m x n integer matrix matrix with the following two properties:

        Each row is sorted in non-decreasing order.
        The first integer of each row is greater than the last integer of the previous row.
        Given an integer target, return true if target is in matrix or false otherwise.
        """

        def find_row(matrix: List[List[int]], target: int) -> int:
            lo, hi = 0, len(matrix) - 1
            while lo <= hi:
                mid = (lo + hi) // 2
                if matrix[mid][0] <= target <= matrix[mid][len(matrix[mid]) - 1]:
                    return mid
                elif target < matrix[mid][0]:
                    hi = mid - 1
                else:
                    lo = mid + 1
            return -1

        row = find_row(matrix, target)
        print("found row")
        if row != -1:
            try:
                # cheating, but not implementing basic search
                _ = matrix[row].index(target)
                return True
            except ValueError:
                return False
        else:
            return False

    def deleteDuplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:
        """
        82: Remove Duplicates from Sorted List II

        Runtime: O(n)
        """

        def not_duplicate(l: ListNode) -> Optional[ListNode]:
            """
            We are returning the first value that is not l.val, else None
            """
            while l.next and l.next.val == l.val:
                l = l.next
            return l

            pass

        sentinel = ListNode(0, head)
        prev = sentinel

        while head:
            if head.next and head.val == head.next.val:
                while head.next and head.val == head.next.val:
                    head = head.next
                prev.next = head.next
            else:
                prev = prev.next

            head = head.next
        return sentinel.next

    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        """
        88: Merge Sorted Array (Easy)
        Do not return anything, modify nums1 in-place instead.
        """
        i1 = m - 1
        i2 = n - 1
        for i in range(m + n - 1, -1, -1):
            if i2 < 0:
                break
            if i1 >= 0 and nums1[i1] > nums2[i2]:
                nums1[i] = nums1[i1]
                i1 -= 1
            else:
                nums1[i] = nums2[i2]
                i2 -= 1

    def generate(self, numRows: int) -> List[List[int]]:
        """
        118: Pascal's Triangle (Easy)
        """
        tri = []
        for r in range(0, numRows):
            # row = [1]
            row = [1 for _ in range(r + 1)]
            for i in range(1, len(row) - 1):
                row[i] = tri[r - 1][i - 1] + tri[r-1][i]
            tri.append(row)
        return tri

    def maxProfit(self, prices: List[int]) -> int:
        """
        121: Best Time to Buy and Sell Stock (Easy)

        Runtime: O(n)
        Space Complexity: O(1)
        """
        low = prices[0]
        profit = 0
        for i in prices:
            profit = max(profit, i - low)
            low = min(low, i)
        return profit

    def findMin(self, nums: List[int]) -> int:
        """
        153: Find Minimum in Rotated Sorted Array (Medium)
        """
        if len(nums) == 1:
            return nums[0]

        lo, hi = 0, len(nums) - 1
        if nums[hi] > nums[0]:
            return nums[0]

        while hi >= lo:
            mi = (lo + hi) // 2
            if nums[mi] > nums[mi + 1]:
                return nums[mi + 1]
            elif nums[mi - 1] > nums[mi]:
                return nums[mi]

            if nums[mi] > nums[0]:
                lo = mi + 1
            else:
                hi = mi - 1

        return 5001  # out of range number - shouldn't happen

    def isIsomorphic(self, s: str, t: str) -> bool:
        """
        # 205: Isomorphic Strings

        Runtime: O(n)
        Space Complexity: O(1) since there are finite amounts of characters, specifically ascii which is given

        We are given that len(s) == len(t)
        """
        hm_s_t: Dict[str, int] = {}
        hm_t_s: Dict[str, int] = {}

        for si, ti in zip(s, t):
            if (si not in hm_s_t.keys()) and (ti not in hm_t_s.keys()):
                hm_s_t[si] = ti
                hm_t_s[ti] = si
            elif hm_s_t.get(si) != ti or hm_t_s.get(ti) != si:
                return False
        return True

    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        """
        # 206: Reverse Linked List
        """
        prev = None
        p = head
        while p:
            next_temp = curr.next
            p.next = prev
            prev = p
            p = next_temp
        return prev

    def containsDuplicate(self, nums: List[int]) -> bool:
        """
        # 217: Contains Duplicates (Easy)

        Runtime: O(n)
        """
        seen = set()
        for i in nums:
            if i in seen:
                return True
            seen.add(i)
        return False

    def intersect(self, nums1: List[int], nums2: List[int]) -> List[int]:
        """
        # 350: Intersection of Two Arrays II (Easy)

        Let m be length of nums1 and n be length of nums2
        Runtime: O(m + n)
        Space Complexity: O(min(m, n))
        """
        (x, y) = (nums1, nums2) if len(nums1) >= len(nums2) else (nums2, nums1)
        hm = {}
        for i in x:
            if hm.get(i, 0) > 0:
                hm[i] += 1
            else:
                hm[i] = 1

        r = []
        for i in y:
            if hm.get(i, 0) > 0:
                r.append(i)
                hm[i] -= 1
        return r

    def isSubsequence(self, s: str, t: str) -> bool:
        """
        392. Is Subsequence

        Runtime: O(n)
        Space Complexity: O(1)
        """
        if len(s) > len(t):
            return False

        si = 0
        for ti in range(0, len(t)):
            if si >= len(s):
                return True
            if s[si] == t[ti]:
                si += 1

        return si == len(s)

    def longestPalindrome(self, s: str) -> int:
        """
        409: Longest Palindrome (Easy)

        Runtime: O(n)
        Space Complexity: O(52), at most we only need a bit for every upper and lowercase letter
        """
        hm: Dict[bool] = {}
        ret = 0
        for i in s:
            if i in hm.keys():
                if hm[i] == True:
                    ret += 2
                hm[i] = not hm[i]
            else:
                hm[i] = True
        for k in hm.keys():
            if hm[k] == 1:
                return ret + 1
        return ret

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

    def backspaceCompare(self, s: str, t: str) -> bool:
        """
        # 844: Backspace String Compare (Easy)

        Let |s| = n, and |t| = m
        Runtime: O(n + m)
        Complexity: O(n + m)
        """
        ss = []
        ts = []
        for c in s:
            if ss and c == "#":
                ss.pop()
            elif c != "#":
                ss.append(c)

        for c in t:
            if ts and c == "#":
                ts.pop()
            elif c != "#":
                ts.append(c)

        return ss == ts

    def runningSum(self, nums: List[int]) -> List[int]:
        """
        # 1480

        Runtime: O(n)
        """
        for i in range(1, len(nums)):
            nums[i] += nums[i - 1]
        return nums


sol = Solution()

x = 5
out = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
sol.check(sol.generate, out, x)

print("PASSED TESTS")
