//
//  CubicEquation.swift
//  Diophanti
//
//  Created by Alexander on 02.02.2022.
//

import Foundation

struct CubicEquation {
    //x³ + ax² + bx + c = 0
    let a: Int
    let b: Int
    let c: Int

    var q: Double {
        (pow(Double(a), 2) + Double(-3 * b)) / 9
    }

    var r: Double {
        (2 * pow(Double(a), 3) + Double(-9 * a * b + 27 * c)) / 54
    }

    func solve() -> (String, String) {
        var solution: String
        let root: String

        solution = """
        We will use the Vieta-Cardano method to solve the cubic equation
        We should use this formulas to find some intermediate values
        Q = (a² - 3b) / 9, R = (2a³- 9ab + 27c) / 54 where a = \(a), b = \(b), c = \(c)
        Q = \(String(format: "%.2f", q)), R = \(String(format: "%.2f", r))\n
        """

        if pow(r, 2) < pow(q, 3) {
            let t = acos(r / sqrt(pow(q, 3))) / 3
            let firstRoot = String(format: "%.2f", -2 * sqrt(q) * cos(t) - Double(a) / 3)
            let secondRoot = String(format: "%.2f", -2 * sqrt(q) * cos(t + 2 * Double.pi / 3) - Double(a) / 3)
            let thirdRoot = String(format: "%.2f", -2 * sqrt(q) * cos(t - 2 * Double.pi / 3) - Double(a) / 3)

            root = "x₁ ≈ \(firstRoot)\nx₂ ≈ \(secondRoot)\nx₃ ≈ \(thirdRoot)"
            solution += """
            R² = \(String(format: "%.2f", pow(r, 2))) and it's less than Q³ = \(String(format: "%.2f", pow(q, 3)))
            That means the equation has three roots
            We can find them with this formulas
            t = acos(R / √Q³) / 3
            x₁ = -2 * √Q * cos(t) - a / 3
            x₂ = -2 * √Q * cos(t + (2 * π / 3)) - a / 3
            x₃ = -2 * √Q * cos(t - (2 * π / 3)) - a / 3
            x₁ = -2 * √\(String(format: "%.2f", q)) * cos(\(String(format: "%.2f", t))) - \(a) / 3
            x₁ = \(firstRoot)
            x₂ = -2 * √\(String(format: "%.2f", q)) * cos(\(String(format: "%.2f", t)) + (2 * π / 3)) - \(a) / 3
            x₂ = \(secondRoot)
            x₃ = -2 * √\(String(format: "%.2f", q)) * cos(\(String(format: "%.2f", t)) - (2 * π / 3)) - \(a) / 3
            x₃ = \(thirdRoot)
            The roots are
            \(root)
            """
        } else {
            let aa = -pow(fabs(r) + sqrt(pow(fabs(r), 2) - pow(q, 3)), 0.33)
            let bb = aa != 0 ? q / aa : 0

            root = "x ≈ \(String(format: "%.2f", aa + bb - Double(a) / 3))"
            solution += """
            R² = \(String(format: "%.2f", pow(r, 2))) and it's bigger or equal than Q³ = \(String(format: "%.2f", pow(q, 3)))
            That means the equation has only one root
            We can find it with this formulas
            A = -(|R| + √(|R|² - Q³))^(1/3)
            B = Q/A if A != 0 or B = 0 if A == 0
            x = A + B - a / 3
            A ≈ \(String(format: "%.2f", aa))
            B ≈ \(String(format: "%.2f", bb))
            \(root)
            """
        }

        return (root, solution)
    }
}
