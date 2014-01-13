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
  end

  def patches
    [
      "https://raw.github.com/kfine/homebrew-extras/master/patches/2.5.13-u_threadpool.c.patch"
    ]
  end

  test do
    system "#{bin}/qstat", "--version"
  end
	
  def caveats; <<-EOS.undent
    pbs_iff is used by qstat and requires superuser privileges. You can either run the program
    via `sudo`, or change its ownership to root and set the setuid bit:

      sudo chown root:wheel #{sbin}/pbs_iff
      sudo chmod u+s #{sbin}/pbs_iff

    In any case, you should be certain that you trust the software you
    are executing with elevated privileges.
    EOS
  end

end
