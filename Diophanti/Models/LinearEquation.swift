//
//  LinearEquation.swift
//  Diophanti
//
//  Created by Alexander on 01.02.2022.
//

struct LinearEquation {
    let coefficient: Int
    let firstFreeMember: Int
    let secondFreeMember: Int

    func solve() -> (String, String) {
        let solution: String
        let root: String

        if coefficient == 0 {
            solution = "Error! This equation is not linear."
            return (solution, solution)
        }

        root = "x ≈ \(Double(-firstFreeMember + secondFreeMember) / Double(coefficient))"
        solution = """
        To solve a linear equation, we transfer all free members to the right side of the equation
        \(coefficient)x = \(-firstFreeMember) + \(secondFreeMember)
        \(coefficient)x = \(-firstFreeMember + secondFreeMember)
        Now we divide the right side of the equation by the coefficient before x
        x = \(-firstFreeMember + secondFreeMember) / \(coefficient)
        The root is
        \(root)
        """

        return (root, solution)
    }
}
