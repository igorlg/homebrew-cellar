class Capstan < Formula
  desc 'Capstan CLI to manage OSv unikernels'
  homepage 'https://github.com/cloudius-systems/capstan'
  url 'https://github.com/cloudius-systems/capstan/archive/v0.4.0.tar.gz'
  sha256 'ad7b86509f503926721c5564881d9f238e488e6354ab1dfa4ef30d1fa12080d2'

  depends_on 'go' => :build

  def install
    system 'go get -d -v github.com/cloudius-systems/capstan'
    system 'go build -a -ldflags "-X main.VERSION=\'v0.4.0\' -w -s" -tags netgo -v -o bin/capstan'
    bin.install 'bin/capstan'
  end

  test do
    system "#{bin}/capstan", '--help'
  end
end
