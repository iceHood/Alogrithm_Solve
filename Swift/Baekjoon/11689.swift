
var N = Int(readLine()!)!
var euler = N
var p = 2

while p * p <= N {
    if N % p == 0 { euler = euler/p*(p-1) }
    while N % p == 0 { N = N/p }
    p += 1
}

print(N == 1 ? euler : euler/N*(N-1))
