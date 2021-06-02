# This formula was copied from https://github.com/dkanejs/homebrew-aws-session-manager-plugin.
# The change I've made is to REMOVE THE DEPENDENCY ON THE FORMULA awscli, so that you can install
# the plugin using Homebrew even if you don't use the Homebrew version of AWS CLI*
#
# *: Obviously, you still need the AWS CLI. But with this formula you don't have to use to Homebrew-managed version!

class AwsSessionManagerPlugin < Formula
  desc "Official Amazon AWS session manager plugin"
  homepage "https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html"

  url "https://s3.amazonaws.com/session-manager-downloads/plugin/1.1.26.0/mac/sessionmanager-bundle.zip"
  version "1.1.26.0"
  sha256 "13297500b74f649d7855f6b444fc292f95ee6a886895b3d5111d2fd5a74b04c7"

  def install
    bin.install "bin/session-manager-plugin"
    prefix.install "seelog.xml.template"
    doc.install %w[LICENSE VERSION]
  end

  def caveats
    <<~EOS
      This formula is a fork of https://github.com/dkanejs/homebrew-aws-session-manager-plugin
      It was created to remove the dependency of Homebrew formula 'awscli', so that you can#{" "}
      install awscli via pip, for example...
    EOS
  end

  test do
    system "session-manager-plugin"
  end
end
