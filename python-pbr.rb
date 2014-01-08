require "formula"

class PythonPbr < Formula
  homepage "https://pypi.python.org/pypi/pbr/"
  url "https://pypi.python.org/packages/source/p/pbr/pbr-0.5.23.tar.gz"
  sha1 "e04a910697cd3f3564edecdf3810522cbb7891f3"

  depends_on :python

  def install
    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end

end
