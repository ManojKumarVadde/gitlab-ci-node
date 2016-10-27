This Dockerfile aims to provide the following components using the least possible space I could manage (662 MB):

  1. Git.
  2. NVM & Node.js 6.9.1 LTS.
  3. Optimal NPM Compatibility (64bit Linux & no stack smashing binaries).
  4. Java 7 (headless).
  5. X Virtual FrameBuffer (`Xvfb`).
  6. Chromium (available as `/usr/bin/google-chrome` too).

It's known to work well with GitLab.
