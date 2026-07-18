# FRR Lab

[![Codespaces][codespaces-svg]][codespaces-url] 

[codespaces-svg]: https://gitlab.com/rdodin/pics/-/wikis/uploads/80546a8c7cda8bb14aa799d26f55bd83/run-codespaces-btn.svg
[codespaces-url]: https://codespaces.new/sakupapa/vnclab?quickstart=1&devcontainer_path=.devcontainer%2Fdocker-in-docker%2Fdevcontainer.json


docker build -t vnc-desktop:bookworm -f Dockerfile.vnc .

gh codespace list
gh codespace ports forward 5900:5900 -c <code space name>
