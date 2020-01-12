class Parallel < Formula
  version "0.11.3"

  desc "A Command-line CPU Load Balancer Written in Rust"
  homepage "https://github.com/mmstick/parallel"
  url "https://github.com/mmstick/parallel/archive/#{version}.tar.gz"
  sha256 "70f09dcbf6d34486e505f3e4a04d4f5e30081ec6cd71920017a8e8090eabc242"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
    bin.install "target/release/parallel" => "parallel"
  end

  test do
    assert shell_output("#{bin}/parallel --version").equal?("MIT\/Rust Parallel #{version}")
  end
end
