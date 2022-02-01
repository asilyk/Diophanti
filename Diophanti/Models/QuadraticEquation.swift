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

    var discriminant : Int {
        Int(pow(Double(secondCoefficient), 2)) - 4 * firstCoefficient * freeMember
    }

    init(firstCoefficient: Int, secondCoefficient: Int, freeMember: Int) {
        self.firstCoefficient = firstCoefficient
        self.secondCoefficient = secondCoefficient
        self.freeMember = freeMember
    }

    func solve() -> [String] {
        var solution: [String] = []

        if (firstCoefficient == 0) {
            solution.append("Error! This equation is not quadratic.")
            return solution
        }

        solution.append("""
            To find the roots of a quadratic equation, it is necessary to find the discriminant according to the formula D = b² - 4ac where b = \(secondCoefficient), a = \(firstCoefficient), c = \(freeMember)
            """)
        solution.append("D = \(secondCoefficient)² - 4 * \(firstCoefficient) * \(freeMember) = \(discriminant)")

        if discriminant < 0 {
            solution.append("This quadratic equation has no roots because D < 0")
            return solution
        }

        if discriminant == 0 {
            solution.append("This quadratic equation has only one root because D = 0")
            solution.append("We can find this root using the formula x = -b / 2a where b = \(secondCoefficient), a = \(firstCoefficient)")

            let root = String(format: "%.2f", -secondCoefficient / (2 * firstCoefficient))

            solution.append("x = -\(secondCoefficient) / (2 * \(firstCoefficient))")

            solution.append("The root is")
            solution.append("x ≈ \(root)")
        }

        if discriminant > 0 {
            solution.append("This quadratic equation has two roots because D > 0")
            solution.append("We can find this roots using the formula x = (-b ± √D) / 2a where b = \(secondCoefficient), D = \(discriminant), a = \(firstCoefficient)")

            let firstRoot = String(format: "%.2f", (-Double(secondCoefficient) - sqrt(Double(discriminant))) / (2 * Double(firstCoefficient)))
            let secondRoot = String(format: "%.2f", (-Double(secondCoefficient) + sqrt(Double(discriminant))) / (2 * Double(firstCoefficient)))

            let rootOfDiscriminant = String(format: "%.2f", sqrt(Double(discriminant)))

            solution.append("x₁ = (\(-secondCoefficient) - √\(discriminant)) / (2 * \(firstCoefficient))")
            solution.append("x₁ = (\(-secondCoefficient) - \(rootOfDiscriminant) / \(2 * firstCoefficient)")
            solution.append("x₁ = \(String(format: "%.2f", Double(-secondCoefficient) - sqrt(Double(discriminant)))) / \(2 * firstCoefficient) = \(firstRoot)")
            
            solution.append("x₂ = (\(-secondCoefficient) + √\(discriminant)) / (2 * \(firstCoefficient))")
            solution.append("x₂ = (\(-secondCoefficient) + \(rootOfDiscriminant)) / \(2 * firstCoefficient)")
            solution.append("x₂ = \(String(format: "%.2f", Double(-secondCoefficient) + sqrt(Double(discriminant)))) / \(2 * firstCoefficient) = \(secondRoot)")

            solution.append("The roots are")
            solution.append("x₁ ≈ \(firstRoot)\nx₂ ≈ \(secondRoot)")
        }

        return solution
    }
}