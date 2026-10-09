import Foundation

let inputFilePath = "Unit2-02-input.txt"
let outputFilePath = "Unit2-02-output.txt"

do {
    let inputContent = try String(contentsOfFile: inputFilePath, encoding: .utf8)
    let lines = inputContent.components(separatedBy: .newlines)
    var outputLines: [String] = []

    for line in lines {
        let trimmedLine = line.trimmingCharacters(in: .whitespaces)

        if !trimmedLine.isEmpty {
            let tokens = trimmedLine.components(separatedBy: .whitespaces).filter { !$0.isEmpty }
            var sum = 0
            var hasError = false

            for token in tokens {
                if let number = Int(token) {
                    sum += number
                } else {
                    hasError = true
                    break
                }
            }

            if hasError {
                outputLines.append("Please enter a valid integer.")
            } else {
                outputLines.append("\(sum)")
            }
        }
    }

    let outputText = outputLines.joined(separator: "\n") + "\n"
    try outputText.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
} catch {
    print("File I/O Error: \(error.localizedDescription)")
}