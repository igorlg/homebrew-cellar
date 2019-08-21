class Capstan < Formula
  desc 'Capstan CLI to manage OSv unikernels'
  homepage 'https://github.com/cloudius-systems/capstan'
  url 'https://github.com/cloudius-systems/capstan/archive/v0.4.0.tar.gz'
  sha256 'ad7b86509f503926721c5564881d9f238e488e6354ab1dfa4ef30d1fa12080d2'

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath/'src'

    (buildpath/'src/github.com/cloudius-systems/capstan').install buildpath.children

    cd 'src/github.com/cloudius-systems/capstan' do
      system 'go', 'get', '-d', '-v', '.'
      system 'go', 'build', '-a', '-v', '-tags', 'netgo', '-o', 'bin/capstan',
                                 '-ldflags', '"-X main.VERSION=v0.4.0 -w -s"',
                                 'capstan.go'
      bin.install 'bin/capstan'
      prefix.install_metafiles
    end
  end

  test do
    system "#{bin}/capstan", '--help'
  end
end
