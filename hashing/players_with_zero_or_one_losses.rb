# You are given an integer array matches where matches[i] = [winner(i), loser(i)] indicates that the player winner(i) defeated player loser(i) in a match.

# Return a list answer of size 2 where:

# answer[0] is a list of all players that have not lost any matches.
# answer[1] is a list of all players that have lost exactly one match.
# The values in the two lists should be returned in increasing order.

# Note:

# You should only consider the players that have played at least one match.
# The testcases will be generated such that no two matches will have the same outcome.

# Constraints:

# 1 <= matches.length <= 10^5
# matches[i].length == 2
# 1 <= winner(i), loser(i) <= 10^5
# winner(i) != loser(i)
# All matches[i] are unique.

# Example 1:
# Input: matches = [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]
# Output: [[1,2,10],[4,5,7,8]]
# Explanation:
# Players 1, 2, and 10 have not lost any matches.
# Players 4, 5, 7, and 8 each have lost one match.
# Players 3, 6, and 9 each have lost two matches.
# Thus, answer[0] = [1,2,10] and answer[1] = [4,5,7,8].

# @param {Integer[][]} matches
# @return {Integer[][]}
# Runtime: O(n + n + (n * logn)) => O(n *logn)
# Space: O(n)
def find_winners(matches)
    losses = {}
    matches.each do |match|
        winner = match[0]
        loser = match[1]
        if losses[winner].nil?
            losses[winner] = 0
        end
        if losses[loser].nil?
            losses[loser] = 0
        end
        losses[winner] = losses[winner] + 0
        losses[loser] = losses[loser] + 1
    end
    all_wins = []
    one_loss = []
    losses.keys.each do |player|
        if losses[player] == 0
            all_wins.push(player)
        elsif losses[player] == 1
            one_loss.push(player)
        end
    end
    return [all_wins.sort, one_loss.sort]
end