#  Maven Central Repository Webhook

##### How to run
```bash
swift run App serve --hostname localhost --port 8080
```

##### How to test
```
curl -X 'POST' 'http://localhost:8080/publish-complete' \
     -H 'content-type: application/json' \
     -H 'accept: application/json' \
     --data-raw '{"deploymentId":"abcdefgh-1234-abcd-1234-abcdefghijkl","timestamp":1710000000000,"status":"VALIDATED","packageUrls":["pkg:maven/org.sonatype.central.test/exampl@1.0.0"],"centralPaths":["https://repo1.maven.org/maven2/org/sonatype/central/test/example/1.0.0/example-1.0.0.pom"]}'
```

##### Check open ports
```bash
sudo ss -tunlp
```

### Links
- https://swiftlang.github.io/swiftly/

