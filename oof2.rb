require 'formula'

class Oof2 < Formula
  homepage 'http://www.ctcms.nist.gov/oof/oof2/'
  url 'http://www.ctcms.nist.gov/oof/oof2/source/oof2-2.1.11.tar.gz'
  sha256 '6bb26ea54297b57e1d5aeb5a579bc3eec904473abc13c0a998dd9506790ca2cb'

  depends_on :python
  depends_on 'homebrew/python/numpy'
  depends_on 'pygtk'
  depends_on 'libgnomecanvas'
  depends_on 'imagemagick'
  depends_on 'pkg-config' => :build
  if MacOS.version >= :mavericks
    depends_on 'homebrew/versions/gcc'
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
