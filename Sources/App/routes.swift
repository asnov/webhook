import Vapor

#if os(Linux)
    import Glibc
#else
    import Darwin.C
#endif

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    app.get("run") { req async -> String in
        let pipe = Pipe()
        let task = Process()

//        task.launchPath = "/usr/bin/env"
//        task.arguments = ["pwd"]

        task.executableURL = .init(fileURLWithPath: "/bin/sh")
//        task.arguments = ["-c", "help"]
        task.arguments = ["-c", "pwd"]
//        task.arguments = ["-c", "ls", "-al"]

        task.standardOutput = pipe
        task.standardError = pipe
        do {
            try task.run()
        } catch {
            print("ERROR:", error)
        }
        task.waitUntilExit()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8) ?? ""
        return output
    }
    
    app.post("publish-complete-async") { req async -> String in
        guard let body = req.body.string else {
            return "Error: body should not be empty"
            //TODO: how to set http error code?
        }
        print(body)
        fflush(stdout)
//        let pass = req.password.async
        return "Ok\n"
    }
    
    app.post("publish-complete") { req -> String in
        guard let body = req.body.string else {
            return "Error: body should not be empty"
            //TODO: how to set http error code?
        }
        print(body)
        fflush(stdout)
        return "Ok\n"
    }

}
