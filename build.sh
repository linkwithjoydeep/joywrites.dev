main() {
  HUGO_VERSION=v0.148.2

  export TZ=Asia/Kolkata

  #Install Hugo
  echo "installing Hugo v${HUGO_VERSION}..."
  curl -LJo https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz
  tar -xf "hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
  cp hugo /opt/buildhome
  rm LICENCE README.md hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz

  # Verify installed versions
  echo "Verifying installations..."
  echo Go: "$(go version)"
  echo Hugo: "$(hugo version)"
  echo Node.js: "$(node --version)"

  # Clone submodules (i.e: themes)
  echo "Cloning submodules..."
  git submodule update --init --recursive
  git config core.quotepath false

  # Building the website
  echo "Building the Site..."
  hugo --gc --minify
}

set -euo pipefall
main "$@"
