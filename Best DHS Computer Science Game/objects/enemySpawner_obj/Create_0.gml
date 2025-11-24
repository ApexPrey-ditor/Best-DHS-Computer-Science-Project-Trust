// initializes values
points = 0
bias = 0
// what waves higher level enemies can spawn at
restrictions = [0, 2, 3, 6, 7, 10, 11, 13, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 27, 28, 30, 31, 33, 35, 36, 37, 39]
// the "cost" of a enemy
cost = [1, 1, 1, 2.5, 1.5, 3, 3, 10, 7, 5, 7, 5, 11, 20, 15, 9, 15, 30, 40, 25, 25, 35, 15, 35, 40, 70, 35, 100]
// the weight of an enemy
weights = [1.2, 0.95, 0.9, 1.1, 1, 1, 1.3, 0.8, 0.5, 0.9, 1.2, 0.95, 1.1, 0.85, 0.8, 1.25, 0.85, 0.7, 0.6, 0.8, 0.85, 0.5, 1.3, 0.4, 0.9, 0.65, 0.75, 0.6]
// how many point an enemy will have
values = []
enemies = 0
endWave = false
waveCash = false
spawning = false

alarmList = []