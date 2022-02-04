//
//  File.swift
//  Diophanti
//
//  Created by Alexander on 01.02.2022.
//

import Foundation

struct QuadraticEquation {
    let firstCoefficient: Int
    let secondCoefficient: Int
    let freeMember: Int

    var discriminant: Int {
        Int(pow(Double(secondCoefficient), 2)) - 4 * firstCoefficient * freeMember
    }

    func solve() -> (String, String) {
        var solution: String
        var root = ""

        if firstCoefficient == 0 {
            root = "Error! This equation is not quadratic."
            solution = root + " First coefficient cannot be zero."
            return (solution, solution)
        }

        solution = """
        To find the roots of a quadratic equation, it is necessary to find the discriminant according to the formula D = b² - 4ac where b = \(secondCoefficient), a = \(firstCoefficient), c = \(freeMember)
        D = \(secondCoefficient)² - 4 * \(firstCoefficient) * \(freeMember) = \(discriminant)\n
        """

        if discriminant < 0 {
            root = "This quadratic equation has no roots because D < 0"
            solution += root
            return (root, solution)
        }

        if discriminant == 0 {
            root = String(format: "x ≈ %.2f", Double(-secondCoefficient) / Double(2 * firstCoefficient))
            solution += """
            This quadratic equation has only one root because D = 0
            We can find this root using the formula x = -b / 2a where b = \(secondCoefficient), a = \(firstCoefficient)
            x = -\(secondCoefficient) / (2 * \(firstCoefficient))
            The root is
            \(root)
            """
        }

        if discriminant > 0 {
            let firstRoot = String(format: "%.2f", (-Double(secondCoefficient) - sqrt(Double(discriminant))) / (2 * Double(firstCoefficient)))
            let secondRoot = String(format: "%.2f", (-Double(secondCoefficient) + sqrt(Double(discriminant))) / (2 * Double(firstCoefficient)))

            let rootOfDiscriminant = String(format: "%.2f", sqrt(Double(discriminant)))

            root = "x₁ ≈ \(firstRoot)\nx₂ ≈ \(secondRoot)"
            solution += """
            This quadratic equation has two roots because D > 0
            We can find this roots using the formula x = (-b ± √D) / 2a where b = \(secondCoefficient), D = \(discriminant), a = \(firstCoefficient)
            x₁ = (\(-secondCoefficient) - √\(discriminant)) / (2 * \(firstCoefficient))
            x₁ = (\(-secondCoefficient) - \(rootOfDiscriminant) / \(2 * firstCoefficient)
            x₁ = \(String(format: "%.2f", Double(-secondCoefficient) - sqrt(Double(discriminant)))) / \(2 * firstCoefficient) = \(firstRoot)
            x₂ = (\(-secondCoefficient) + √\(discriminant)) / (2 * \(firstCoefficient))
            x₂ = (\(-secondCoefficient) + \(rootOfDiscriminant)) / \(2 * firstCoefficient)
            x₂ = \(String(format: "%.2f", Double(-secondCoefficient) + sqrt(Double(discriminant)))) / \(2 * firstCoefficient) = \(secondRoot)
            The roots are
            \(root)
            """
        }

        return (root, solution)
    }
}
