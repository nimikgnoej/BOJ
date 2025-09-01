from itertools import permutations

def can_pronounce(word):
    chunks = ("aya", "ye", "woo", "ma")
    i, prev = 0, ""
    while i < len(word):
        matched = False
        for ch in chunks:
            if ch != prev and word.startswith(ch, i):
                i += len(ch)
                prev = ch
                matched = True
                break
        if not matched:
            return False
    return True

def solution(babbling):
    return sum(1 for w in babbling if can_pronounce(w))