require 'formula'

class Oof2 < Formula
  homepage 'http://www.ctcms.nist.gov/oof/oof2/'
  url 'http://www.ctcms.nist.gov/oof/oof2/source/oof2-2.1.9.tar.gz'
  sha256 '7c623974355ec2a89cb49e08d4b0c39ae5d41952ee5d2aea9f5d6d5ab0d636f1'

  depends_on :python
  depends_on 'homebrew/python/numpy'
  depends_on 'pygtk'
  depends_on 'libgnomecanvas'
  depends_on 'imagemagick'
  depends_on 'pkg-config' => :build

  if MacOS.version >= :mavericks
    depends_on 'homebrew/versions/gcc42'
    fails_with :llvm do
      cause <<-EOS.undent
      Const failure or whatever
      EOS
    end
    fails_with :clang do
      cause <<-EOS.undent
      Const failure or whatever
      EOS
    end
  end
  def install
    system "python", "setup.py", "build", "--skip-swig", "install", "--prefix=#{prefix}"
  end
end
