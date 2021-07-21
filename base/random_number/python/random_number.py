A = 7
B = 5
M = 11
X = 2
# X是随机数种子
for i in range(11):
    X = (A * X + B) % M
    print(X)