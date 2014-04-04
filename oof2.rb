require 'formula'

class Oof2 < Formula
  homepage 'http://www.ctcms.nist.gov/oof/oof2/'
  url 'http://www.ctcms.nist.gov/oof/oof2/source/oof2-2.1.9.tar.gz' 
  md5 '6363ef9105949dcdc0c33ea58207d93c'

  depends_on :python 
  depends_on 'homebrew/python/numpy' 
  depends_on 'pygtk'
  depends_on 'libgnomecanvas'
  depends_on 'imagemagick'
  depends_on 'pkg-config'

  if MacOS.version >= :mavericks
	  depends_on apple-gcc42
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
