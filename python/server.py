import http.server
import socketserver
import re

PORT = 8181

class MyRequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        # change all /home, login, ..... -> /
        if not re.search(r"\.\w+$", self.path):
            self.path = '/'
        return http.server.SimpleHTTPRequestHandler.do_GET(self)

Handler = MyRequestHandler
httpd = socketserver.TCPServer(("", PORT), Handler)

print("Serving at http://localhost:" + str(PORT))
httpd.serve_forever()