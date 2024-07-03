import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    let port = Int(Environment.get("PORT") ?? "8080")
    let hostname = Environment.get("HOSTNAME") ?? "localhost"

    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    // register routes

    app.commands.use(HelloCommand(), as: "hola")
    app.http.server.configuration.address = .hostname(hostname, port: port)
    app.http.server.configuration.serverName = "Apache"
    
    try routes(app)
}
