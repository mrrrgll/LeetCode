import Foundation

public class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
    }
}
// MARK: - 二叉树的最大深度
public func maxDepth(_ root: TreeNode?) -> Int {
    return root == nil ? 0 : max(maxDepth(root!.left), maxDepth(root!.right)) + 1
}
// MARK: - 验证二叉搜索树
public func isValidBST(_ root: TreeNode?) -> Bool {
    func helper(_ node: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        guard let node = node else {
            return true
        }
        if let min = min, node.val <= min {
            return false
        }
        if let max = max, node.val >= max {
            return false
        }
        return helper(node.left, min, node.val) && helper(node.right, node.val, max)
    }
    return helper(root, nil, nil)
}
// MARK: - 对称二叉树
public func isSymmetric(_ root: TreeNode?) -> Bool {
    
    return false
}
// MARK: - 二叉树的层次遍历
public func levelOrder(_ root: TreeNode?) -> [[Int]] {
    
    return []
}
// MARK: - 将有序数组转换为二叉搜索树
public func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    
    return nil
}
