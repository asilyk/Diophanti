//
//  LogarithmicEquation.swift
//  Diophanti
//
//  Created by Alexander on 02.02.2022.
//

import Foundation

struct LogarithmicEquation {
    let exponent: Int
    let logValue: Int

    func solve() -> (String, String) {
        let base: String
        let solution: String

        if exponent <= 0 {
            solution = """
            Exponent can be only positive number
            """
            return (solution, solution)
        }

        base = String(format: "x ≈ %.2f", pow(Double(exponent), 1.0 / Double(logValue)))
        solution = """
        If you want to find base of logarithm you should find the nth root of the exponent
        This nth root will be "\(logValue)th" root
        logₓ\(exponent) = \(logValue)
        x = nthroot(\(exponent), \(logValue))
        \(base)
        Sometimes it is useful to find this root using the exponent form of equation
        x = nthroot(\(exponent), \(logValue)) = \(exponent)^(1 / \(logValue))
        """

        return (base, solution)
    }
}
