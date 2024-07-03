//
//  File.swift
//  
//
//  Created by Alex on 23/06/2024.
//

import Vapor

final class HelloCommand: Command {

    let help = "This command will say hello to a given name."
    
    struct Signature: CommandSignature {
        @Argument(name: "name", help: "The name to say hello")
        var name: String
    }

    func run(using context: ConsoleKitCommands.CommandContext, signature: Signature) throws {
        print("Hello \(signature.name)!")
    }

}
