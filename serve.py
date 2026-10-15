#!/usr/bin/env python3
"""
AEGIS-NEO Local Demo Server
Zero-dependency HTTP server with auto-launch and CORS headers for NASA Space Apps hackathon judging demos.
"""
import http.server
import socketserver
import webbrowser
import os
import sys

PORT = 8080
DIRECTORY = os.path.dirname(os.path.abspath(__file__))

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)

    def end_headers(self):
        # Allow cross-origin requests for NASA APIs and local assets
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Cache-Control', 'no-store, must-revalidate')
        super().end_headers()

def main():
    os.chdir(DIRECTORY)
    with socketserver.TCPServer(("", PORT), Handler) as httpd:
        url = f"http://localhost:{PORT}"
        print("=" * 60)
        print(" 🛰️  AEGIS-NEO PLANETARY DEFENSE DEMO SERVER ACTIVE")
        print(f" 🌐 Local Endpoint: {url}")
        print(" 🛑 Press Ctrl+C to terminate.")
        print("=" * 60)
        try:
            webbrowser.open(url)
        except Exception:
            pass
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\nShutting down server. Safe skies!")
            sys.exit(0)

if __name__ == "__main__":
    main()
