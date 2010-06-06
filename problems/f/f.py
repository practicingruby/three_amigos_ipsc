
def Alla(cubes):
  cubes.sort(reverse=True)
  # if there are more than 15 cubes, take 15 largest
  N = min(15, len(cubes))
  result = 0
  # try all possible sets of cubes in the first tower
  for first in range(2**N):
    first_tower, remains = 0, []
    for i in range(N):
      if (1 << i) & first: first_tower += cubes[i]
      else: remains.append( cubes[i] )
    M = len(remains)
    # try all possible sets of cubes in the second tower
    for second in range(2**M):
      second_tower = 0
      for i in range(M):
        if (1 << i) & second: second_tower += remains[i]
      if first_tower==second_tower: result = max( result, first_tower )
  return result

def partition(cubes):
  S = sum(cubes)
  if S%2: return False
  possible = [False]*(S+1)
  possible[0] = True
  for c in cubes:
    for j in range(S,c-1,-1):
      if possible[j-c]:
        possible[j] = True
  return possible[S/2]

def Bob(cubes):
  N, S = len(cubes), sum(cubes)
  if partition(cubes): return S/2
  result = 0

  # try all possibilities without one cube
  for i in range(N):
    tmp = cubes[:i] + cubes[i+1:]
    if partition(tmp): result = max( result, (S-cubes[i])/2 )

  # try all possibilities without two cubes
  for i in range(N):
    for j in range(i):
      tmp = cubes[:j] + cubes[j+1:i] + cubes[i+1:]
      if partition(tmp): result = max(result, (S-cubes[i]-cubes[j])/2 )

  return result

def Chermi(cubes):
  cubes.sort(reverse=True)
  N, S = len(cubes), sum(cubes)
  for height in range(S/2,0,-1):
    first_tower, second_tower = 0, 0
    for c in cubes:
      if first_tower + c <= height: 
        first_tower += c
      if first_tower > second_tower:
        first_tower, second_tower = second_tower, first_tower
    if first_tower==height and second_tower==height: return height
  return 0

def Dominika(cubes):
  N, S = len(cubes), sum(cubes)
  ways = [0]*(S+1)
  ways[0] = 1
  for c in cubes:
    for j in range(S,c-1,-1):
      ways[j] = min( 2, ways[j] + ways[j-c] )
  for height in range(S/2,0,-1):
    if ways[2*height]>0 and ways[height]>1: return height
  return 0

from sys import stdin
N = int( stdin.readline() )
cubes = [ int(x) for x in stdin.read().split() ]
print 'Alla:',Alla(cubes)
print 'Bob:',Bob(cubes)
print 'Chermi:',Chermi(cubes)
print 'Dominika:',Dominika(cubes)

