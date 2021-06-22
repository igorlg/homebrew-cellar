class DockerRequirement < Requirement
  fatal true

  satisfy(build_env: false) { self.class.docker_installed? }

  def self.docker_installed?
    File.exist?("/usr/local/bin/docker") || File.exist?("/usr/local/opt/docker")
  end
end

class CodebuildLocal < Formula
  desc "Script to run AWS CodeBuild locally using Docker"
  homepage "https://github.com/aws/aws-codebuild-docker-images"
  url "https://github.com/aws/aws-codebuild-docker-images.git", using: :git, tag: '21.04.23'

  depends_on DockerRequirement

  def install
    bin.install "local_builds/codebuild_build.sh" => "codebuild-local"
  end

  test do
    system "#{bin}/codebuild_local", "-h"
  end
end
