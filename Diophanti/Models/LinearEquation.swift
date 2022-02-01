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

    init(coefficient: Int, firstFreeMember: Int, secondFreeMember: Int) {
        self.coefficient = coefficient
        self.firstFreeMember = firstFreeMember
        self.secondFreeMember = secondFreeMember
    }

    func solve() -> [String] {
        var solution: [String] = []

        if (coefficient == 0) {
            solution.append("Error! This equation is not linear.")
            return solution
        }

        solution.append("To solve a linear equation, we transfer all free members to the right side of the equation")
        solution.append("\(coefficient)x = \(-firstFreeMember) + \(secondFreeMember)")
        solution.append("\(coefficient)x = \(-firstFreeMember + secondFreeMember)")
        solution.append("Now we divide the right side of the equation by the coefficient before x")
        solution.append("x = \(-firstFreeMember + secondFreeMember) / \(coefficient)")
        solution.append("The root is")
        solution.append("x ≈ \(Double(-firstFreeMember + secondFreeMember) / Double(coefficient))")

        return solution
    }
}
