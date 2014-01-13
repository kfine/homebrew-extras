require 'formula'

class TorqueClient < Formula
  homepage 'http://www.adaptivecomputing.com/products/open-source/torque/'
  url 'http://www.adaptivecomputing.com/index.php?wpfb_dl=1643'
  version '2.5.13'
  sha1 '2290a8d9330bc9d7bcc37ec2e75b0d5d59e67e9c'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--disable-mom",
                          "--disable-unixsockets",
                          "--disable-gui",
                          "--with-default-server=torqueserver.lpl.arizona.edu",
                          "--disable-gcc-warnings",
                          "--with-tcp-retry-limit=2",
                          "--disable-server"

    system "make"
    system "make", "install_clients"
		system "chmod", "4755 #{sbin}/pbs_iff"
  end

  def patches
    [
      "https://raw.github.com/kfine/homebrew-extras/master/patches/2.5.13-u_threadpool.c.patch"
    ]
  end

  test do
    system "#{bin}/qstat", "--version"
  end
end
