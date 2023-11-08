class Solution {
    func isReachableAtTime(_ sx: Int, _ sy: Int, _ fx: Int, _ fy: Int, _ t: Int) -> Bool {
        var dx = fx - sx
        var dy = fy - sy
        if dx == 0 && dy == 0 { return t != 1 }
        var move = min(abs(dx), abs(dy))
        dx -= move*dx.signum()
        dy -= move*dy.signum()
        move += abs(dx) + abs(dy)
        return move <= t
    }
}
